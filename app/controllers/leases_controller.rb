class LeasesController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end
    
    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def invalid_record(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end



end
