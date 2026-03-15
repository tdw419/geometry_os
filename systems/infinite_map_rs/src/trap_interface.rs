//! Trap Interface - Glyph ↔ Rust Shim Communication
//!
//! Memory-mapped region at 0xFF00_0000 for glyph programs to request
//! operations that require Rust/wgpu context.

/// Base address of trap interface in substrate memory
pub const TRAP_BASE: u32 = 0xFF00_0000;

/// Trap operation types
pub mod op_type {
    pub const READ_BUFFER: u32 = 1;
    pub const WRITE_BUFFER: u32 = 2;
    pub const SPAWN_VM: u32 = 3;
    pub const KILL_VM: u32 = 4;
    pub const PEEK_SUBSTRATE: u32 = 5;
    pub const POKE_SUBSTRATE: u32 = 6;
}

/// Trap status values
pub mod status {
    pub const IDLE: u32 = 0;
    pub const PENDING: u32 = 1;
    pub const COMPLETE: u32 = 2;
}

/// Trap interface offsets (relative to TRAP_BASE)
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct TrapRegs {
    pub op_type: u32,    // +0x00
    pub arg0: u32,       // +0x04
    pub arg1: u32,       // +0x08
    pub arg2: u32,       // +0x0C
    pub result: u32,     // +0x10
    pub status: u32,     // +0x14
}

impl Default for TrapRegs {
    fn default() -> Self {
        Self {
            op_type: 0,
            arg0: 0,
            arg1: 0,
            arg2: 0,
            result: 0,
            status: status::IDLE,
        }
    }
}

impl TrapRegs {
    /// Convert substrate address to TrapRegs pointer
    pub fn from_substrate_addr(addr: u32) -> *const Self {
        debug_assert!(addr >= TRAP_BASE);
        let offset = (addr - TRAP_BASE) as usize;
        // This is for documentation; actual access goes through texture reads
        std::ptr::null()
    }
}
