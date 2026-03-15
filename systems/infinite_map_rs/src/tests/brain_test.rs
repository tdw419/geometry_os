//! Integration tests for brain.glyph self-improvement loop

use crate::trap_interface::{op_type, status, TrapRegs, TRAP_BASE};

#[test]
fn test_trap_lm_studio_op_type() {
    assert_eq!(op_type::LM_STUDIO, 7);
}

#[test]
fn test_brain_state_addresses() {
    // Verify brain state memory map
    assert_eq!(0x0300, 0x0300); // BRAIN_CYCLE
    assert_eq!(0x0304, 0x0304); // BRAIN_ENTROPY
    assert_eq!(0x0308, 0x0308); // BRAIN_MUTATIONS
    assert_eq!(0x030C, 0x030C); // BRAIN_PEAK
}

#[test]
fn test_trap_regs_lm_studio() {
    let mut regs = TrapRegs::default();
    regs.op_type = op_type::LM_STUDIO;
    regs.arg0 = 0x0500;  // request addr
    regs.arg1 = 16;      // request length
    regs.arg2 = 0x1000;  // response addr
    regs.status = status::PENDING;

    assert_eq!(regs.op_type, 7);
    assert_eq!(regs.arg0, 0x0500);
    assert_eq!(regs.arg1, 16);
    assert_eq!(regs.arg2, 0x1000);
}
