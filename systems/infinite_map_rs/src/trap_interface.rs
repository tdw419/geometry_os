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
    pub const LM_STUDIO: u32 = 7; // Request LM Studio inference
    pub const GLYPH_WRITE: u32 = 8; // Copy glyphs between substrate locations
    pub const WASM_HOST_CALL: u32 = 9; // WASM → Rust host function call
}

/// GLYPH_WRITE operation constant (for convenience)
pub const GLYPH_WRITE_OP: u32 = 8;

/// Trap status values
pub mod status {
    pub const IDLE: u32 = 0;
    pub const PENDING: u32 = 1;
    pub const COMPLETE: u32 = 2;
}

/// Brain state memory addresses (for brain.glyph self-improvement loop)
pub mod brain_state {
    pub const BRAIN_CYCLE: u32 = 0x0300;
    pub const BRAIN_ENTROPY: u32 = 0x0304;
    pub const BRAIN_MUTATIONS: u32 = 0x0308;
    pub const BRAIN_PEAK: u32 = 0x030C;
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

    /// Create TrapRegs from byte array (24 bytes = 6 u32s)
    pub fn from_bytes(bytes: [u8; 24]) -> Self {
        Self {
            op_type: u32::from_le_bytes([bytes[0], bytes[1], bytes[2], bytes[3]]),
            arg0: u32::from_le_bytes([bytes[4], bytes[5], bytes[6], bytes[7]]),
            arg1: u32::from_le_bytes([bytes[8], bytes[9], bytes[10], bytes[11]]),
            arg2: u32::from_le_bytes([bytes[12], bytes[13], bytes[14], bytes[15]]),
            result: u32::from_le_bytes([bytes[16], bytes[17], bytes[18], bytes[19]]),
            status: u32::from_le_bytes([bytes[20], bytes[21], bytes[22], bytes[23]]),
        }
    }

    /// Convert TrapRegs to byte array
    pub fn to_bytes(&self) -> [u8; 24] {
        let mut bytes = [0u8; 24];
        bytes[0..4].copy_from_slice(&self.op_type.to_le_bytes());
        bytes[4..8].copy_from_slice(&self.arg0.to_le_bytes());
        bytes[8..12].copy_from_slice(&self.arg1.to_le_bytes());
        bytes[12..16].copy_from_slice(&self.arg2.to_le_bytes());
        bytes[16..20].copy_from_slice(&self.result.to_le_bytes());
        bytes[20..24].copy_from_slice(&self.status.to_le_bytes());
        bytes
    }
}
