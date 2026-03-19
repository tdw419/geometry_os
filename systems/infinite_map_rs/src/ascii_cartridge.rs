//! ASCII Cartridge Loader
//!
//! Bridges geos-ascii .rts.png cartridges to Synthetic VRAM and GPU Substrate.
//!
//! Cartridge format (5 vertical segments):
//!   - Segment 1 (top, 80x24): Glyph Grid - ASCII characters as RGBA pixels
//!   - Segment 2 (256x80): SIT - Spatial Instruction Table
//!   - Segment 3 (1024x80): State Buffer - mutable state
//!   - Segment 4 (16x80): Bootstrap header
//!   - Segment 5 (256x80): Program bytecode (Phase 50 Ascension)

use image::GenericImageView;
use std::path::Path;

pub const GLYPH_WIDTH: u32 = 80;
pub const GLYPH_HEIGHT: u32 = 24;
pub const SIT_ENTRIES: u32 = 256;
pub const STATE_BUFFER_SIZE: u32 = 1024;
pub const BOOTSTRAP_HEIGHT: u32 = 16;
pub const PROGRAM_HEIGHT: u32 = 256;

/// Memory layout constants (must match compiler)
pub mod mem_layout {
    pub const GLYPH_BASE: u32 = 0x0000;
    pub const GLYPH_SIZE: u32 = 80 * 24;

    pub const RESERVED_BASE: u32 = 0x0C00;
    pub const RESERVED_SIZE: u32 = 0x7400;

    pub const PROGRAM_BASE: u32 = 0x8000;
    pub const PROGRAM_SIZE: u32 = 0x7000;

    pub const STATE_BASE: u32 = 0xF000;
    pub const STATE_SIZE: u32 = 0x0400;
}

#[derive(Clone, Debug)]
pub struct SitAction {
    pub x: u32,
    pub y: u32,
    pub opcode: u8,
    pub target: String,
    pub target_addr: u32,
}

#[derive(Clone, Debug)]
pub struct BootstrapHeader {
    pub name: String,
    pub version: String,
    pub pattern_count: u16,
    pub magic: [u8; 16],
}

pub struct AsciiCartridge {
    pub glyph_grid: Vec<u8>,
    pub sit_entries: Vec<SitAction>,
    pub state_buffer: Vec<u8>,
    pub program_buffer: Vec<u32>,
    pub bootstrap: BootstrapHeader,
    pub width: u32,
    pub height: u32,
}

pub fn sit_to_glyph_opcode(sit_opcode: u8) -> u8 {
    match sit_opcode {
        0 => 0,   // NOP
        1 => 9,   // JUMP -> JMP (9 in aligned ISA)
        2 => 11,  // CALL -> CALL
        255 => 13,// EXIT -> HALT
        other => other,
    }
}

impl AsciiCartridge {
    pub fn load<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        let img = image::open(path).map_err(|e| format!("Failed to load image: {}", e))?;
        let (width, height) = img.dimensions();
        let rgba = img.to_rgba8();
        let pixels = rgba.as_raw();

        // 1. Glyph Grid
        let mut glyph_grid = vec![0u8; (GLYPH_WIDTH * GLYPH_HEIGHT * 4) as usize];
        for y in 0..GLYPH_HEIGHT {
            for x in 0..GLYPH_WIDTH {
                let idx = ((y * width + x) * 4) as usize;
                let dest_idx = ((y * GLYPH_WIDTH + x) * 4) as usize;
                if idx + 3 < pixels.len() {
                    glyph_grid[dest_idx..dest_idx + 4].copy_from_slice(&pixels[idx..idx + 4]);
                }
            }
        }

        // 2. SIT
        let sit_start_y = GLYPH_HEIGHT;
        let mut sit_entries = Vec::new();
        for y in 0..SIT_ENTRIES {
            for x in 0..GLYPH_WIDTH {
                let idx = (((sit_start_y + y) * width + x) * 4) as usize;
                if idx + 3 < pixels.len() {
                    let opcode = pixels[idx];
                    if opcode != 0 {
                        let target_int = (pixels[idx + 1] as u16) | ((pixels[idx + 2] as u16) << 8);
                        sit_entries.push(SitAction {
                            x, y, opcode: sit_to_glyph_opcode(opcode),
                            target: format!("0x{:X}", target_int),
                            target_addr: target_int as u32,
                        });
                    }
                }
            }
        }

        // 3. State Buffer
        let state_start_y = GLYPH_HEIGHT + SIT_ENTRIES;
        let mut state_buffer = vec![0u8; (STATE_BUFFER_SIZE * GLYPH_WIDTH * 4) as usize];
        for y in 0..STATE_BUFFER_SIZE {
            for x in 0..GLYPH_WIDTH {
                let idx = (((state_start_y + y) * width + x) * 4) as usize;
                let dest_idx = ((y * GLYPH_WIDTH + x) * 4) as usize;
                if idx + 3 < pixels.len() {
                    state_buffer[dest_idx..dest_idx + 4].copy_from_slice(&pixels[idx..idx + 4]);
                }
            }
        }

        // 4. Bootstrap
        let bootstrap_start_y = GLYPH_HEIGHT + SIT_ENTRIES + STATE_BUFFER_SIZE;
        let name = String::from_utf8_lossy(&pixels[(bootstrap_start_y * width * 4) as usize..((bootstrap_start_y * width * 4) + 16) as usize]).trim_matches('\0').to_string();
        let bootstrap = BootstrapHeader {
            name, version: "1.0.0".into(), pattern_count: sit_entries.len() as u16, magic: [0; 16],
        };

        // 5. Program (Segment 5 - Ascension)
        let program_start_y = GLYPH_HEIGHT + SIT_ENTRIES + STATE_BUFFER_SIZE + BOOTSTRAP_HEIGHT;
        let mut program_buffer = Vec::new();
        for y in 0..PROGRAM_HEIGHT {
            for x in 0..GLYPH_WIDTH {
                let idx = (((program_start_y + y) * width + x) * 4) as usize;
                if idx + 3 < pixels.len() {
                    program_buffer.push(u32::from_le_bytes([pixels[idx], pixels[idx+1], pixels[idx+2], pixels[idx+3]]));
                }
            }
        }

        Ok(Self { glyph_grid, sit_entries, state_buffer, program_buffer, bootstrap, width, height })
    }

    pub fn get_state_buffer_u32(&self) -> Vec<u32> {
        self.state_buffer.chunks_exact(4).map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]])).collect()
    }

    pub fn get_glyph_grid_u32(&self) -> Vec<u32> {
        self.glyph_grid.chunks_exact(4).map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]])).collect()
    }
}
