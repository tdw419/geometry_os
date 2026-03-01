// ============================================
// RISC-V EXECUTOR (SUBGROUP OPTIMIZED)
// ============================================
// Phase 45: Parallel Instruction Dispatch via Subgroups
//
// This version uses hardware subgroup operations to eliminate 
// atomic lock contention for instruction fetching.

enable subgroups;

// ... (Constants, Structs, and Functions same as riscv_executor.wgsl)
// For brevity, I'll focus on the optimized main function.
// In a real implementation, all previous helper functions would be included.

// ============================================
// Optimized Main Entry Point
// ============================================

@compute @workgroup_size(64) // Larger workgroup for better subgroup utilization
fn main_riscv_subgroup(
    @builtin(global_invocation_id) global_id: vec3<u32>,
    @builtin(local_invocation_id) local_id: vec3<u32>,
    @builtin(subgroup_invocation_id) lane_id: u32,
    @builtin(subgroup_size) sg_size: u32
) {
    let lid = local_id.x;

    // Thread 0: Initialize shared state
    if (lid == 0u) {
        atomicStore(&shared_pc, uniforms.pc);
        shared_instructions_executed = 0u;
        shared_halt_flag = 0u;
    }
    workgroupBarrier();

    // Check if VM is running
    if (uniforms.status & 1u) == 0u { return; }
    if (vm_status[uniforms.vm_id] != 0u) { return; }

    var loop_limit = uniforms.instruction_count / sg_size;
    
    for (var iter: u32 = 0u; iter <= loop_limit; iter++) {
        if (shared_halt_flag != 0u) { break; }

        // --- SUBGROUP PC FETCH ---
        // Lane 0 fetches the base PC for the entire subgroup
        var base_pc: u32 = 0u;
        if (subgroupElect()) {
            // Only the leader needs to use an atomic to get the PC block
            base_pc = atomicAdd(&shared_pc, sg_size * 4u);
        }
        
        // Broadcast the base PC to all lanes in the subgroup
        base_pc = subgroupBroadcast(base_pc, 0u);

        // Each lane calculates its own PC
        let pc = base_pc + (lane_id * 4u);

        // --- PARALLEL EXECUTION ---
        // Execute instruction independently in each lane
        let next_pc = execute_instruction(pc);

        // --- BRANCH DETECTION ---
        // Check if this instruction branched (diverged from linear flow)
        let branched = (next_pc != pc + 4u);
        
        // Find if ANY lane in the subgroup branched
        let any_branched = subgroupAny(branched);

        if (any_branched) {
            // Find the FIRST lane that branched (program order)
            let first_branch_lane = subgroupBallot(branched);
            let leader_lane = first_trailing_zeros(first_branch_lane[0]); 
            
            // The first branching lane's target becomes the new shared PC
            let branch_target = subgroupBroadcast(next_pc, leader_lane);
            
            if (subgroupElect()) {
                // Correct the shared PC back to the branch target
                // (Subtracting the unused portion of the pre-allocated block)
                atomicStore(&shared_pc, branch_target);
            }
            
            // Record instructions executed up to the branch
            if (lane_id <= leader_lane) {
                atomicAdd(&shared_instructions_executed, 1u);
            }
            
            // We must break or handle the branch before continuing the loop
            break; 
        } else {
            // No branches: all instructions were successful
            atomicAdd(&shared_instructions_executed, sg_size);
        }

        // Check for halt signal in any lane
        if (subgroupAny(next_pc == 0xFFFFFFFFu)) {
            shared_halt_flag = 1u;
            break;
        }
    }

    // ... (Stats update logic)
}
