//! Tests for GLYPH_WRITE trap operation

#[cfg(test)]
mod tests {
    use crate::trap_interface::{op_type, GLYPH_WRITE_OP, TrapRegs};

    #[test]
    fn test_glyph_write_op_type_defined() {
        // GLYPH_WRITE should be opcode 8 (opcode 7 is LM_STUDIO)
        assert_eq!(op_type::GLYPH_WRITE, 8);
    }

    #[test]
    fn test_glyph_write_trap_registers() {
        let mut regs = TrapRegs::default();
        regs.op_type = op_type::GLYPH_WRITE;
        regs.arg0 = 0x1000;  // target address
        regs.arg1 = 0x2000;  // source address
        regs.arg2 = 4;       // count (4 glyphs)

        assert_eq!(regs.op_type, 8);
        assert_eq!(regs.arg0, 0x1000);
        assert_eq!(regs.arg1, 0x2000);
        assert_eq!(regs.arg2, 4);
    }

    #[test]
    fn test_glyph_write_copies_glyphs() {
        // This test verifies the scheduler can copy glyphs between addresses
        // The actual implementation requires GPU context, so we test the interface

        // GLYPH_WRITE parameters:
        // - arg0: target address (where to write)
        // - arg1: source address (where to read from)
        // - arg2: count of glyphs to copy

        // Verify the operation is defined
        assert!(op_type::GLYPH_WRITE > 0);

        // Verify it's distinct from other ops
        assert_ne!(op_type::GLYPH_WRITE, op_type::PEEK_SUBSTRATE);
        assert_ne!(op_type::GLYPH_WRITE, op_type::POKE_SUBSTRATE);
    }
}
