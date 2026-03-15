//! Integration tests for trap interface

#[cfg(test)]
mod tests {
    use crate::trap_interface::{TrapRegs, op_type, status, TRAP_BASE};

    #[test]
    fn test_trap_regs_size() {
        // TrapRegs should be 24 bytes (6 x u32)
        assert_eq!(std::mem::size_of::<TrapRegs>(), 24);
    }

    #[test]
    fn test_trap_base_address() {
        // Trap base should be in high memory
        assert_eq!(TRAP_BASE, 0xFF000000);
    }

    #[test]
    fn test_op_types() {
        assert_eq!(op_type::READ_BUFFER, 1);
        assert_eq!(op_type::WRITE_BUFFER, 2);
        assert_eq!(op_type::SPAWN_VM, 3);
        assert_eq!(op_type::KILL_VM, 4);
        assert_eq!(op_type::PEEK_SUBSTRATE, 5);
        assert_eq!(op_type::POKE_SUBSTRATE, 6);
    }

    #[test]
    fn test_status_values() {
        assert_eq!(status::IDLE, 0);
        assert_eq!(status::PENDING, 1);
        assert_eq!(status::COMPLETE, 2);
    }

    #[test]
    fn test_trap_regs_default() {
        let regs = TrapRegs::default();
        assert_eq!(regs.status, status::IDLE);
        assert_eq!(regs.op_type, 0);
        assert_eq!(regs.result, 0);
    }
}
