//! ASCII-Native Self-Hosting Bootstrap
//!
//! This module provides Glyph VM programs that compile ASCII assembly text
//! directly on the VM itself - true self-hosting capability.
//!
//! ## Architecture
//!
//! ```text
//! ┌─────────────────────────────────────────────────────────────┐
//! │              ASCII-Native Self-Hosting Bootstrap             │
//! ├─────────────────────────────────────────────────────────────┤
//! │                                                              │
//! │  ┌──────────────┐     ┌──────────────┐     ┌─────────────┐ │
//! │  │  Glyph Grid  │────▶│ ASCII Parser │────▶│   Emit      │ │
//! │  │  (Source)    │     │  (on VM)     │     │  Buffer     │ │
//! │  │  80x24 ASCII │     │              │     │  (Program)  │ │
//! │  └──────────────┘     └──────────────┘     └─────────────┘ │
//! │         ▲                                          │         │
//! │         │                                          ▼         │
//! │  ┌──────────────┐     ┌──────────────┐     ┌─────────────┐ │
//! │  │  State       │◀───│  VM Execute  │◀───│  SIT        │ │
//! │  │  Buffer      │     │  (Spawn)     │     │  (Actions)  │ │
//! │  └──────────────┘     └──────────────┘     └─────────────┘ │
//! │                                                              │
//! └─────────────────────────────────────────────────────────────┘
//! ```
//!
//! ## Memory Layout
//!
//! | Range | Purpose |
//! |-------|---------|
//! | 0x0000-0x0BFF | Glyph Grid (80x24 = 1920 cells, 4 bytes each) |
//! | 0x0C00-0x0FFF | Reserved/SIT (256 entries) |
//! | 0x1000-0x1FFF | State Buffer (1024 cells) |
//! | 0x2000-0x20FF | Assembler Code (~256 words) |
//! | 0x2100-0x21FF | Label Table (~256 entries) |
//! | 0x2200-0x2FFF | Emit Buffer (compiled programs) |
//! | 0x3000-0x3FFF | Working Memory (parsing state) |
//! | 0x8000-0xFFFF | Program Segment (cartridge output) |

pub mod self_hosting_template;
pub mod memory {
    //! Memory layout constants for ASCII-native programs

    /// Glyph Grid base address (80x24 cells)
    pub const GLYPH_BASE: u32 = 0x0000;
    /// Glyph Grid size (80 * 24 = 1920 cells)
    pub const GLYPH_SIZE: u32 = 80 * 24;

    /// Reserved/SIT base address
    pub const SIT_BASE: u32 = 0x0C00;
    /// SIT entry count
    pub const SIT_ENTRIES: u32 = 256;

    /// State Buffer base address
    pub const STATE_BASE: u32 = 0x1000;
    /// State Buffer size
    pub const STATE_SIZE: u32 = 1024;

    /// Assembler code base address
    pub const ASSEMBLER_BASE: u32 = 0x2000;
    /// Assembler code size
    pub const ASSEMBLER_SIZE: u32 = 256;

    /// Label table base address
    pub const LABEL_TABLE_BASE: u32 = 0x2100;
    /// Label table size (entries)
    pub const LABEL_TABLE_SIZE: u32 = 256;

    /// Emit buffer base address (compiled programs)
    pub const EMIT_BUFFER_BASE: u32 = 0x2200;
    /// Emit buffer size
    pub const EMIT_BUFFER_SIZE: u32 = 0x0E00; // ~3.5K words

    /// Working memory base address
    pub const WORKING_BASE: u32 = 0x3000;
    /// Working memory size
    pub const WORKING_SIZE: u32 = 0x1000;

    /// Program segment base address (cartridge output)
    pub const PROGRAM_BASE: u32 = 0x8000;
    /// Program segment size
    pub const PROGRAM_SIZE: u32 = 0x8000;

    /// Cursor position (state offset)
    pub const STATE_CURSOR: u32 = 0;
    /// Buffer length (state offset)
    pub const STATE_BUFFER_LEN: u32 = 1;
    /// Editor mode: 0=edit, 1=compile, 2=run (state offset)
    pub const STATE_MODE: u32 = 2;
    /// Status code: 0=ok, 1=error (state offset)
    pub const STATE_STATUS: u32 = 3;

    /// Mailbox event type address
    pub const MAILBOX_EVENT: u32 = 0x0200;
    /// Mailbox parameter address
    pub const MAILBOX_PARAM: u32 = 0x0201;

    /// Text buffer base address
    pub const TEXT_BUFFER_BASE: u32 = 0x1000;

    /// Compute glyph grid address for (x, y)
    pub const fn glyph_addr(x: u32, y: u32) -> u32 {
        GLYPH_BASE + y * 80 + x
    }

    /// Compute state address for index
    pub const fn state_addr(index: u32) -> u32 {
        STATE_BASE + index
    }
}

pub mod events {
    //! Event types for ASCII-native editor

    /// Insert character event
    pub const EVENT_INSERT: u32 = 1;
    /// Delete (backspace) event
    pub const EVENT_DELETE: u32 = 2;
    /// Cursor left event
    pub const EVENT_CURSOR_LEFT: u32 = 3;
    /// Cursor right event
    pub const EVENT_CURSOR_RIGHT: u32 = 4;
    /// Compile event
    pub const EVENT_COMPILE: u32 = 5;
    /// Run event
    pub const EVENT_RUN: u32 = 6;
    /// Render event
    pub const EVENT_RENDER: u32 = 7;
}

pub mod opcodes {
    //! Opcode constants for the Glyph VM (Aligned ISA)
    //!
    //! These match the WGSL scheduler and synthetic_vram.rs

    pub const NOP: u8 = 0;
    pub const LDI: u8 = 1;
    pub const MOV: u8 = 2;
    pub const LOAD: u8 = 3;
    pub const STORE: u8 = 4;
    pub const ADD: u8 = 5;
    pub const SUB: u8 = 6;
    pub const MUL: u8 = 7;
    pub const DIV: u8 = 8;
    pub const JMP: u8 = 9;
    pub const BRANCH: u8 = 10;
    pub const CALL: u8 = 11;
    pub const RET: u8 = 12;
    pub const HALT: u8 = 13;
    pub const DATA: u8 = 14;
    pub const LOOP: u8 = 15;
    pub const JAL: u8 = 16;
    pub const AND: u8 = 128;
    pub const OR: u8 = 129;
    pub const XOR: u8 = 130;
    pub const SLL: u8 = 131;
    pub const SRL: u8 = 132;
    pub const SRA: u8 = 133;
    pub const DRAW: u8 = 215;
}

/// ASCII-Native Assembler utilities
pub struct AsciiNativeAssembler;

impl AsciiNativeAssembler {
    /// Get the source code for the ASCII-native assembler Glyph program
    ///
    /// This program runs on the Glyph VM and:
    /// 1. Reads ASCII from glyph grid (0x0000-0x0BFF)
    /// 2. Parses mnemonics character by character
    /// 3. Emits opcodes to emit buffer (0x2200)
    pub fn assembler_source() -> &'static str {
        include_str!("assembler.glyph")
    }

    /// Get the source code for the ASCII-native cartridge writer Glyph program
    ///
    /// This program:
    /// 1. Takes bytecode from emit buffer
    /// 2. Writes to program segment at 0x8000
    /// 3. Sets up SIT entries for button patterns
    pub fn cartridge_writer_source() -> &'static str {
        include_str!("cartridge_writer.glyph")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_memory_layout_constants() {
        // Verify layout doesn't overlap
        assert!(memory::GLYPH_BASE + memory::GLYPH_SIZE <= memory::SIT_BASE);
        assert!(memory::SIT_BASE + memory::SIT_ENTRIES <= memory::STATE_BASE);
        assert!(memory::STATE_BASE + memory::STATE_SIZE <= memory::ASSEMBLER_BASE);
        assert!(memory::ASSEMBLER_BASE + memory::ASSEMBLER_SIZE <= memory::LABEL_TABLE_BASE);
        assert!(memory::LABEL_TABLE_BASE + memory::LABEL_TABLE_SIZE <= memory::EMIT_BUFFER_BASE);
        assert!(memory::EMIT_BUFFER_BASE + memory::EMIT_BUFFER_SIZE <= memory::WORKING_BASE);
        assert!(memory::WORKING_BASE + memory::WORKING_SIZE <= memory::PROGRAM_BASE);
    }

    #[test]
    fn test_glyph_addr() {
        assert_eq!(memory::glyph_addr(0, 0), 0);
        assert_eq!(memory::glyph_addr(79, 0), 79);
        assert_eq!(memory::glyph_addr(0, 1), 80);
        assert_eq!(memory::glyph_addr(79, 23), 79 + 23 * 80);
    }
}
