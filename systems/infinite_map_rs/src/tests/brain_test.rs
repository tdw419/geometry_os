//! Integration tests for brain.glyph self-improvement loop

use crate::trap_interface::{brain_state, op_type, status, TrapRegs, TRAP_BASE};

#[test]
fn test_trap_lm_studio_op_type() {
    assert_eq!(op_type::LM_STUDIO, 7);
}

#[test]
fn test_brain_state_addresses() {
    // Verify brain state memory map against constants
    assert_eq!(0x0300, brain_state::BRAIN_CYCLE);
    assert_eq!(0x0304, brain_state::BRAIN_ENTROPY);
    assert_eq!(0x0308, brain_state::BRAIN_MUTATIONS);
    assert_eq!(0x030C, brain_state::BRAIN_PEAK);
}

#[test]
fn test_trap_regs_lm_studio() {
    let mut regs = TrapRegs::default();
    regs.op_type = op_type::LM_STUDIO;
    regs.arg0 = 0x0500; // request addr
    regs.arg1 = 16; // request length
    regs.arg2 = 0x1000; // response addr
    regs.status = status::PENDING;

    assert_eq!(regs.op_type, 7);
    assert_eq!(regs.arg0, 0x0500);
    assert_eq!(regs.arg1, 16);
    assert_eq!(regs.arg2, 0x1000);
}

#[test]
fn test_trap_lifecycle_simulation() {
    // Simulate the full trap lifecycle as would occur in brain.glyph:
    // 1. Create trap regs in IDLE state
    // 2. Set op_type and args
    // 3. Set status to PENDING
    // 4. Simulate completion (result written, status -> COMPLETE)
    // 5. Verify final state

    // Step 1: Start with default (IDLE) trap registers
    let mut regs = TrapRegs::default();
    assert_eq!(regs.status, status::IDLE, "Initial status should be IDLE");
    assert_eq!(regs.op_type, 0, "Initial op_type should be 0");

    // Step 2: Configure for LM_STUDIO inference request
    regs.op_type = op_type::LM_STUDIO;
    regs.arg0 = brain_state::BRAIN_ENTROPY; // Read entropy as input
    regs.arg1 = 4; // 4 bytes
    regs.arg2 = 0x2000; // Response buffer address

    // Step 3: Mark as PENDING to signal Rust shim to process
    regs.status = status::PENDING;
    assert_eq!(
        regs.status,
        status::PENDING,
        "Status should be PENDING after setting"
    );

    // Step 4: Simulate completion by Rust shim
    // The shim would read the request, process it, write result, and set COMPLETE
    regs.result = 0xABCD_1234; // Simulated inference result
    regs.status = status::COMPLETE;

    // Step 5: Verify final state
    assert_eq!(
        regs.op_type,
        op_type::LM_STUDIO,
        "op_type should remain LM_STUDIO"
    );
    assert_eq!(
        regs.arg0,
        brain_state::BRAIN_ENTROPY,
        "arg0 should be preserved"
    );
    assert_eq!(regs.arg1, 4, "arg1 should be preserved");
    assert_eq!(regs.arg2, 0x2000, "arg2 should be preserved");
    assert_eq!(
        regs.result, 0xABCD_1234,
        "result should contain shim response"
    );
    assert_eq!(
        regs.status,
        status::COMPLETE,
        "Status should be COMPLETE after processing"
    );
}

#[test]
fn test_trap_roundtrip_bytes() {
    // Test that TrapRegs can be serialized to bytes and back
    let original = TrapRegs {
        op_type: op_type::LM_STUDIO,
        arg0: brain_state::BRAIN_CYCLE,
        arg1: 100,
        arg2: 0x1000,
        result: 0xDEAD_BEEF,
        status: status::COMPLETE,
    };

    let bytes = original.to_bytes();
    let restored = TrapRegs::from_bytes(bytes);

    assert_eq!(restored.op_type, original.op_type);
    assert_eq!(restored.arg0, original.arg0);
    assert_eq!(restored.arg1, original.arg1);
    assert_eq!(restored.arg2, original.arg2);
    assert_eq!(restored.result, original.result);
    assert_eq!(restored.status, original.status);
}

#[test]
fn test_multiple_trap_operations_sequence() {
    // Simulate a sequence of trap operations as brain.glyph might perform

    let mut regs = TrapRegs::default();

    // Operation 1: Read entropy
    regs.op_type = op_type::READ_BUFFER;
    regs.arg0 = brain_state::BRAIN_ENTROPY;
    regs.arg1 = 4;
    regs.status = status::PENDING;

    // Simulate completion
    regs.result = 42; // Entropy value
    regs.status = status::COMPLETE;
    assert_eq!(regs.result, 42);

    // Operation 2: Request LM Studio inference based on entropy
    regs.op_type = op_type::LM_STUDIO;
    regs.arg0 = brain_state::BRAIN_ENTROPY;
    regs.arg1 = 4;
    regs.arg2 = 0x5000; // Response buffer
    regs.result = 0; // Clear previous result
    regs.status = status::PENDING;

    // Simulate LM Studio response
    regs.result = 1; // Mutation decision: yes
    regs.status = status::COMPLETE;

    // Operation 3: Write mutation count
    regs.op_type = op_type::WRITE_BUFFER;
    regs.arg0 = brain_state::BRAIN_MUTATIONS;
    regs.arg1 = 1; // Increment by 1
    regs.arg2 = 0;
    regs.result = 0;
    regs.status = status::PENDING;

    // Simulate write completion
    regs.result = 0; // Success
    regs.status = status::COMPLETE;

    // Verify final state shows completed write operation
    assert_eq!(regs.op_type, op_type::WRITE_BUFFER);
    assert_eq!(regs.arg0, brain_state::BRAIN_MUTATIONS);
    assert_eq!(regs.status, status::COMPLETE);
}
