//! ASCII Cartridge Loader
//!
//! Bridges geos-ascii .rts.png cartridges to Synthetic VRAM
//!
//! Cartridge format (4 vertical segments):
//!   - Segment 1 (top, 80x24): Glyph Grid - ASCII characters as RGBA pixels
//!   - Segment 2 (256x80): SIT - Spatial Instruction Table
//!   - Segment 3 (1024x80): State Buffer - mutable state
//!   - Segment 4 (bottom, 16x80): Bootstrap header
//!
//! The loader parses these segments and:
//!   1. Maps glyph grid to Hilbert addresses (for VM to read)
//!   2. Parses SIT entries into actionable VM instructions
//!   3. Initializes state buffer
//!   4. Extracts bootstrap metadata

use image::GenericImageView;
use std::path::Path;

pub const GLYPH_WIDTH: u32 = 80;
pub const GLYPH_HEIGHT: u32 = 24;
pub const SIT_ENTRIES: u32 = 256;
pub const STATE_BUFFER_SIZE: u32 = 1024;
pub const BOOTSTRAP_HEIGHT: u32 = 16;

/// SIT action parsed from cartridge
#[derive(Clone, Debug)]
pub struct SitAction {
    pub x: u32,
    pub y: u32,
    pub opcode: u8,
    pub target: String,
}

/// Bootstrap header parsed from cartridge  
#[derive(Clone, Debug)]
pub struct BootstrapHeader {
    pub name: String,
    pub version: String,
    pub pattern_count: u16,
    pub magic: [u8; 16],
}

/// Loaded ASCII cartridge
pub struct AsciiCartridge {
    pub glyph_grid: Vec<u8>,
    pub sit_entries: Vec<SitAction>,
    pub state_buffer: Vec<u8>,
    pub bootstrap: BootstrapHeader,
    pub width: u32,
    pub height: u32,
}

/// Opcodes aligned with Glyph VM
pub const GLYPH_OPCODES: &[(&str, u8)] = &[
    ("NOP", 0),
    ("LD", 3),
    ("ST", 4),
    ("ADD", 5),
    ("SUB", 6),
    ("MUL", 7),
    ("DIV", 8),
    ("JMP", 209),
    ("JZ", 10),
    ("JAL", 11),
    ("CALL", 11),
    ("RET", 12),
    ("HALT", 13),
    ("LDI", 204),
    ("MOV", 206),
    ("AND", 220),
    ("OR", 221),
    ("XOR", 222),
    ("NOT", 223),
    ("SHL", 224),
    ("SHR", 225),
    ("SAR", 226),
];

/// Legacy SIT opcodes from compiler (for compatibility)
pub const SIT_OPCODES: &[(&str, u8)] = &[
    ("NOP", 0),
    ("JUMP", 1), // Legacy - maps to JMP (209)
    ("CALL", 2), // Legacy - maps to CALL (11)
    ("TOGGLE", 3),
    ("INPUT", 4),
    ("OUTPUT", 5),
    ("EXIT", 255), // Legacy - maps to HALT (13)
];

/// Convert legacy SIT opcode to real Glyph VM opcode
pub fn sit_to_glyph_opcode(sit_opcode: u8) -> u8 {
    match sit_opcode {
        0 => 0,         // NOP -> NOP
        1 => 209,       // JUMP -> JMP
        2 => 11,        // CALL -> CALL
        3 => 0,         // TOGGLE -> NOP (not implemented)
        4 => 0,         // INPUT -> NOP
        5 => 0,         // OUTPUT -> NOP
        255 => 13,      // EXIT -> HALT
        other => other, // Pass through
    }
}

impl AsciiCartridge {
    /// Load cartridge from PNG file
    pub fn load<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        let path = path.as_ref();

        if !path.exists() {
            return Err(format!("Cartridge file not found: {}", path.display()));
        }

        let img = image::open(path).map_err(|e| format!("Failed to load image: {}", e))?;

        let (width, height) = img.dimensions();

        // Ensure we have enough height for all segments
        let expected_height = GLYPH_HEIGHT + SIT_ENTRIES + STATE_BUFFER_SIZE + BOOTSTRAP_HEIGHT;
        if height < expected_height {
            return Err(format!(
                "Cartridge too short: {} pixels, expected at least {}",
                height, expected_height
            ));
        }

        let rgba = img.to_rgba8();
        let pixels = rgba.as_raw();

        // Parse glyph grid (segment 1)
        let mut glyph_grid = vec![0u8; (GLYPH_WIDTH * GLYPH_HEIGHT * 4) as usize];
        for y in 0..GLYPH_HEIGHT {
            for x in 0..GLYPH_WIDTH {
                let idx = ((y * width + x) * 4) as usize;
                let dest_idx = ((y * GLYPH_WIDTH + x) * 4) as usize;
                if idx + 3 < pixels.len() && dest_idx + 3 < glyph_grid.len() {
                    glyph_grid[dest_idx..dest_idx + 4].copy_from_slice(&pixels[idx..idx + 4]);
                }
            }
        }

        // Parse SIT entries (segment 2)
        let sit_start_y = GLYPH_HEIGHT;
        let mut sit_entries = Vec::new();

        // SIT is 256 entries stored as 256x80, each entry at y*80 + x
        // But we store them row-major in the PNG
        for y in 0..SIT_ENTRIES {
            for x in 0..GLYPH_WIDTH {
                let idx = (((sit_start_y + y) * width + x) * 4) as usize;
                if idx + 3 < pixels.len() {
                    let opcode = pixels[idx];
                    let p1 = pixels[idx + 1];
                    let p2 = pixels[idx + 2];

                    if opcode != 0 {
                        // Decode target from p1, p2 bytes
                        let target_int = (p1 as u16) | ((p2 as u16) << 8);
                        let target = decode_target(target_int);

                        // Convert legacy SIT opcode to Glyph VM opcode
                        let glyph_opcode = sit_to_glyph_opcode(opcode);

                        sit_entries.push(SitAction {
                            x,
                            y,
                            opcode: glyph_opcode,
                            target,
                        });
                    }
                }
            }
        }

        // Parse state buffer (segment 3)
        let state_start_y = GLYPH_HEIGHT + SIT_ENTRIES;
        let mut state_buffer = vec![0u8; (STATE_BUFFER_SIZE * GLYPH_WIDTH * 4) as usize];
        for y in 0..STATE_BUFFER_SIZE {
            for x in 0..GLYPH_WIDTH {
                let idx = (((state_start_y + y) * width + x) * 4) as usize;
                let dest_idx = ((y * GLYPH_WIDTH + x) * 4) as usize;
                if idx + 3 < pixels.len() && dest_idx + 3 < state_buffer.len() {
                    state_buffer[dest_idx..dest_idx + 4].copy_from_slice(&pixels[idx..idx + 4]);
                }
            }
        }

        // Parse bootstrap header (segment 4)
        let bootstrap_start_y = GLYPH_HEIGHT + SIT_ENTRIES + STATE_BUFFER_SIZE;

        // Read name (row 0)
        let mut name_bytes = Vec::new();
        for x in 0..16 {
            let idx = (((bootstrap_start_y) * width + x) * 4) as usize;
            if idx < pixels.len() && pixels[idx] != 0 {
                name_bytes.push(pixels[idx]);
            }
        }
        let name = String::from_utf8_lossy(&name_bytes).to_string();

        // Read version (row 1)
        let version = format!(
            "{}.{}.{}",
            pixels[((bootstrap_start_y + 1) * width) as usize],
            pixels[((bootstrap_start_y + 1) * width + 1) as usize],
            pixels[((bootstrap_start_y + 1) * width + 2) as usize]
        );

        // Read pattern count (row 2)
        let pattern_count = u16::from_le_bytes([
            pixels[((bootstrap_start_y + 2) * width) as usize],
            pixels[((bootstrap_start_y + 2) * width + 1) as usize],
        ]);

        // Read magic (row 3)
        let mut magic = [0u8; 16];
        for x in 0..16 {
            magic[x as usize] = pixels[((bootstrap_start_y + 3) * width + x) as usize];
        }

        let bootstrap = BootstrapHeader {
            name,
            version,
            pattern_count,
            magic,
        };

        Ok(Self {
            glyph_grid,
            sit_entries,
            state_buffer,
            bootstrap,
            width,
            height,
        })
    }

    /// Load cartridge data into Synthetic VRAM at specified base address
    pub fn load_into_vram(
        &self,
        vram: &mut crate::synthetic_vram::SyntheticVram,
        base_addr: u32,
    ) -> Result<(), String> {
        // Write glyph grid to VRAM
        for y in 0..GLYPH_HEIGHT {
            for x in 0..GLYPH_WIDTH {
                let src_idx = ((y * GLYPH_WIDTH + x) * 4) as usize;
                if src_idx + 3 < self.glyph_grid.len() {
                    let r = self.glyph_grid[src_idx];
                    let g = self.glyph_grid[src_idx + 1];
                    let b = self.glyph_grid[src_idx + 2];
                    let a = self.glyph_grid[src_idx + 3];

                    let val = u32::from_le_bytes([r, g, b, a]);

                    // Map to Hilbert address
                    let linear_idx = y * GLYPH_WIDTH + x;
                    let hilbert_addr = base_addr + linear_idx;

                    vram.poke(hilbert_addr, val);
                }
            }
        }

        // Write state buffer to VRAM (starting after glyph grid)
        let state_base = base_addr + (GLYPH_WIDTH * GLYPH_HEIGHT);
        for y in 0..STATE_BUFFER_SIZE {
            for x in 0..GLYPH_WIDTH {
                let src_idx = ((y * GLYPH_WIDTH + x) * 4) as usize;
                if src_idx + 3 < self.state_buffer.len() {
                    let r = self.state_buffer[src_idx];
                    let g = self.state_buffer[src_idx + 1];
                    let b = self.state_buffer[src_idx + 2];
                    let a = self.state_buffer[src_idx + 3];

                    let val = u32::from_le_bytes([r, g, b, a]);
                    let hilbert_addr = state_base + y * GLYPH_WIDTH + x;

                    vram.poke(hilbert_addr, val);
                }
            }
        }

        Ok(())
    }

    /// Get all SIT actions that can be executed
    pub fn get_actions(&self) -> &[SitAction] {
        &self.sit_entries
    }

    /// Find action at screen coordinate
    pub fn find_action_at(&self, x: u32, y: u32) -> Option<&SitAction> {
        self.sit_entries.iter().find(|a| a.x == x && a.y == y)
    }
}

/// Decode target string from packed bytes
fn decode_target(packed: u16) -> String {
    // Simple 3-byte ASCII decode
    let bytes = packed.to_le_bytes();
    let s = String::from_utf8_lossy(&bytes).to_string();
    s.trim_end_matches('\0').to_string()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_sit_opcode_conversion() {
        assert_eq!(sit_to_glyph_opcode(0), 0); // NOP -> NOP
        assert_eq!(sit_to_glyph_opcode(1), 209); // JUMP -> JMP
        assert_eq!(sit_to_glyph_opcode(2), 11); // CALL -> CALL
        assert_eq!(sit_to_glyph_opcode(255), 13); // EXIT -> HALT
    }

    #[test]
    fn test_opcode_constants() {
        // Verify Glyph VM opcodes match expected values
        assert_eq!(
            GLYPH_OPCODES.iter().find(|(n, _)| *n == "JMP").unwrap().1,
            209
        );
        assert_eq!(
            GLYPH_OPCODES.iter().find(|(n, _)| *n == "CALL").unwrap().1,
            11
        );
        assert_eq!(
            GLYPH_OPCODES.iter().find(|(n, _)| *n == "HALT").unwrap().1,
            13
        );
    }
}
