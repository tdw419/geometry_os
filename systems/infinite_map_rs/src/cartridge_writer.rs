//! CartridgeWriter - GPU-native .rts.png cartridge generator
//!
//! This module generates GPU-native cartridges in the 5-segment vertical format:
//! 1. Glyph Grid: 80x24 pixels (ASCII display)
//! 2. SIT: 80x256 pixels (Spatial Instruction Table)
//! 3. State Buffer: 80x1024 pixels (mutable state)
//! 4. Bootstrap: 80x16 pixels (metadata header)
//! 5. Program: 80x256 pixels (executable bytecode)
//!
//! Total: 80x1576 pixels

use png::{BitDepth, ColorType, Encoder};
use regex::Regex;
use std::collections::HashMap;
use std::io::Cursor;

// Segment dimensions (width is constant at 80 pixels)
pub const WIDTH: usize = 80;

// Segment heights
pub const GLYPH_GRID_HEIGHT: usize = 24;
pub const SIT_HEIGHT: usize = 256;
pub const STATE_BUFFER_HEIGHT: usize = 1024;
pub const BOOTSTRAP_HEIGHT: usize = 16;
pub const PROGRAM_HEIGHT: usize = 256;

// Total cartridge height
pub const TOTAL_HEIGHT: usize =
    GLYPH_GRID_HEIGHT + SIT_HEIGHT + STATE_BUFFER_HEIGHT + BOOTSTRAP_HEIGHT + PROGRAM_HEIGHT;

// Segment Y offsets (from top)
pub const GLYPH_GRID_Y: usize = 0;
pub const SIT_Y: usize = GLYPH_GRID_HEIGHT;
pub const STATE_BUFFER_Y: usize = SIT_Y + SIT_HEIGHT;
pub const BOOTSTRAP_Y: usize = STATE_BUFFER_Y + STATE_BUFFER_HEIGHT;
pub const PROGRAM_Y: usize = BOOTSTRAP_Y + BOOTSTRAP_HEIGHT;

/// Configuration for cartridge generation
#[derive(Debug, Clone)]
pub struct CartridgeConfig {
    /// Name of the cartridge (stored in bootstrap metadata)
    pub name: String,
    /// Version of the cartridge format
    pub version: u32,
}

impl Default for CartridgeConfig {
    fn default() -> Self {
        Self {
            name: String::from("unnamed"),
            version: 1,
        }
    }
}

/// Detected button pattern for SIT interaction
#[derive(Debug, Clone)]
pub struct Pattern {
    pub x: u32,
    pub y: u32,
    pub label: char,
    pub action: String,
}

/// GPU-native cartridge writer
///
/// Generates .rts.png cartridges with 5 vertical segments for GPU-native execution.
pub struct CartridgeWriter {
    config: CartridgeConfig,
    /// RGBA pixel buffer (width * height * 4 bytes)
    pixels: Vec<u8>,
}

impl CartridgeWriter {
    /// Create a new cartridge writer with the given configuration
    pub fn new(config: CartridgeConfig) -> Self {
        let pixel_count = WIDTH * TOTAL_HEIGHT * 4; // RGBA
        Self {
            config,
            pixels: vec![0u8; pixel_count],
        }
    }

    /// Get the cartridge width in pixels
    pub fn width(&self) -> usize {
        WIDTH
    }

    /// Get the cartridge height in pixels
    pub fn height(&self) -> usize {
        TOTAL_HEIGHT
    }

    /// Set a pixel at (x, y) to the given RGBA color
    fn set_pixel(&mut self, x: usize, y: usize, r: u8, g: u8, b: u8, a: u8) {
        if x < WIDTH && y < TOTAL_HEIGHT {
            let offset = (y * WIDTH + x) * 4;
            self.pixels[offset] = r;
            self.pixels[offset + 1] = g;
            self.pixels[offset + 2] = b;
            self.pixels[offset + 3] = a;
        }
    }

    /// Set a character in the glyph grid segment
    ///
    /// The character is encoded as grayscale intensity in the R channel.
    /// x: 0-79, y: 0-23
    pub fn set_glyph(&mut self, x: usize, y: usize, ch: char) {
        if x < WIDTH && y < GLYPH_GRID_HEIGHT {
            // Encode ASCII character as pixel intensity
            let intensity = if ch.is_ascii() {
                ch as u8
            } else {
                0 // Non-ASCII rendered as null
            };
            self.set_pixel(x, GLYPH_GRID_Y + y, intensity, intensity, intensity, 255);
        }
    }

    /// Load multiline text into the glyph grid
    ///
    /// Text is rendered character-by-character into the 80x24 grid.
    /// Lines beyond 24 are truncated, characters beyond 80 per line are truncated.
    pub fn load_glyph_text(&mut self, text: &str) {
        for (y, line) in text.lines().take(GLYPH_GRID_HEIGHT).enumerate() {
            for (x, ch) in line.chars().take(WIDTH).enumerate() {
                self.set_glyph(x, y, ch);
            }
        }
    }

    /// Set a Spatial Instruction Table (SIT) entry
    ///
    /// Each SIT entry is a single pixel encoding:
    /// - R: opcode
    /// - G: target address low byte
    /// - B: target address high byte
    /// - A: reserved (255)
    ///
    /// idx: 0-255 (maps to y coordinate in SIT segment)
    pub fn set_sit(&mut self, idx: usize, opcode: u8, target_addr: u16) {
        if idx < SIT_HEIGHT {
            let y = SIT_Y + idx;
            self.set_pixel(
                0, // SIT entries use column 0
                y,
                opcode,
                (target_addr & 0xFF) as u8,
                ((target_addr >> 8) & 0xFF) as u8,
                255,
            );
        }
    }

    /// Set the program bytecode
    ///
    /// Each 32-bit word is encoded as 4 consecutive pixels in the program segment.
    /// Words are packed left-to-right, top-to-bottom.
    /// - Pixel 0: byte 0 (LSB)
    /// - Pixel 1: byte 1
    /// - Pixel 2: byte 2
    /// - Pixel 3: byte 3 (MSB)
    pub fn set_program(&mut self, words: &[u32]) {
        for (i, &word) in words.iter().enumerate() {
            let pixel_base = i * 4;
            if pixel_base + 3 < WIDTH * PROGRAM_HEIGHT {
                let x = pixel_base % WIDTH;
                let y = PROGRAM_Y + (pixel_base / WIDTH);

                // Encode word as 4 pixels (little-endian)
                self.set_pixel(x, y, (word & 0xFF) as u8, 0, 0, 255);
                if pixel_base + 1 < WIDTH * PROGRAM_HEIGHT {
                    let x1 = (pixel_base + 1) % WIDTH;
                    let y1 = PROGRAM_Y + ((pixel_base + 1) / WIDTH);
                    self.set_pixel(x1, y1, ((word >> 8) & 0xFF) as u8, 0, 0, 255);
                }
                if pixel_base + 2 < WIDTH * PROGRAM_HEIGHT {
                    let x2 = (pixel_base + 2) % WIDTH;
                    let y2 = PROGRAM_Y + ((pixel_base + 2) / WIDTH);
                    self.set_pixel(x2, y2, ((word >> 16) & 0xFF) as u8, 0, 0, 255);
                }
                if pixel_base + 3 < WIDTH * PROGRAM_HEIGHT {
                    let x3 = (pixel_base + 3) % WIDTH;
                    let y3 = PROGRAM_Y + ((pixel_base + 3) / WIDTH);
                    self.set_pixel(x3, y3, ((word >> 24) & 0xFF) as u8, 0, 0, 255);
                }
            }
        }
    }

    /// Set a segment of words at a specific address in the state buffer
    ///
    /// This writes bytecode words at arbitrary addresses, useful for embedding
    /// the assembler program at specific locations like 0x2000.
    ///
    /// # Arguments
    /// * `address` - Target address (converts to pixel coordinates)
    /// * `words` - Bytecode words to write
    pub fn set_segment(&mut self, address: u32, words: &[u32]) {
        // Convert address to pixel coordinates
        // Each row is 80 pixels (width)
        // State buffer starts at row STATE_BUFFER_Y (280)
        let start_row = address / 80;
        let start_col = address % 80;

        for (i, word) in words.iter().enumerate() {
            let pixel_idx = (start_row * 80 + start_col) as usize + i;
            let absolute_row = STATE_BUFFER_Y + (pixel_idx / WIDTH);
            let absolute_col = pixel_idx % WIDTH;

            if absolute_row < STATE_BUFFER_Y + STATE_BUFFER_HEIGHT {
                // Pack u32 into 4 pixels (little-endian)
                let r = (word & 0xFF) as u8;
                let g = ((word >> 8) & 0xFF) as u8;
                let b = ((word >> 16) & 0xFF) as u8;
                let a = ((word >> 24) & 0xFF) as u8;
                self.set_pixel(absolute_col, absolute_row, r, g, b, a);
            }
        }
    }

    /// Set source text at a specific address in the state buffer
    ///
    /// This embeds ASCII source code as individual bytes at arbitrary addresses,
    /// useful for embedding source at locations like 0x1000.
    ///
    /// # Arguments
    /// * `address` - Target address (converts to pixel coordinates)
    /// * `text` - ASCII text to embed
    pub fn set_source_text(&mut self, address: u32, text: &str) {
        let start_row = address / 80;
        let start_col = address % 80;

        for (i, byte) in text.bytes().enumerate() {
            let pixel_idx = (start_row * 80 + start_col) as usize + i;
            let absolute_row = STATE_BUFFER_Y + (pixel_idx / WIDTH);
            let absolute_col = pixel_idx % WIDTH;

            if absolute_row < STATE_BUFFER_Y + STATE_BUFFER_HEIGHT {
                // Embed ASCII byte as single pixel (R channel)
                self.set_pixel(absolute_col, absolute_row, byte, 0, 0, 255);
            }
        }
    }

    /// Write bootstrap metadata header
    ///
    /// Encodes cartridge name and version into the bootstrap segment.
    fn write_bootstrap(&mut self) {
        // First 16 pixels: name (null-terminated, max 16 chars)
        // Clone name to avoid borrow conflict
        let name_chars: Vec<(usize, char)> = self
            .config
            .name
            .chars()
            .take(16)
            .enumerate()
            .collect();
        for (i, ch) in name_chars {
            let ascii_val = if ch.is_ascii() { ch as u8 } else { 0 };
            self.set_pixel(i, BOOTSTRAP_Y, ascii_val, 0, 0, 255);
        }

        // Pixel 16-19: version as little-endian u32
        let version = self.config.version;
        self.set_pixel(16, BOOTSTRAP_Y, (version & 0xFF) as u8, 0, 0, 255);
        self.set_pixel(17, BOOTSTRAP_Y, ((version >> 8) & 0xFF) as u8, 0, 0, 255);
        self.set_pixel(18, BOOTSTRAP_Y, ((version >> 16) & 0xFF) as u8, 0, 0, 255);
        self.set_pixel(19, BOOTSTRAP_Y, ((version >> 24) & 0xFF) as u8, 0, 0, 255);
    }

    /// Generate PNG bytes for the cartridge
    ///
    /// Returns the raw PNG file bytes ready to be written to disk.
    pub fn to_png(&self) -> Result<Vec<u8>, String> {
        let mut output = Cursor::new(Vec::new());

        {
            let mut encoder = Encoder::new(&mut output, WIDTH as u32, TOTAL_HEIGHT as u32);
            encoder.set_color(ColorType::Rgba);
            encoder.set_depth(BitDepth::Eight);

            let mut writer = encoder
                .write_header()
                .map_err(|e| format!("PNG header error: {}", e))?;

            writer
                .write_image_data(&self.pixels)
                .map_err(|e| format!("PNG data error: {}", e))?;
        }

        Ok(output.into_inner())
    }

    /// Get a reference to the raw RGBA pixel buffer
    pub fn pixels(&self) -> &[u8] {
        &self.pixels
    }

    /// Get the cartridge configuration
    pub fn config(&self) -> &CartridgeConfig {
        &self.config
    }

    /// Get a character from the glyph grid at (x, y)
    ///
    /// Returns the ASCII character or '\0' if out of bounds.
    /// Space (0x20) is returned as a space character.
    fn get_glyph(&self, x: usize, y: usize) -> char {
        if x < WIDTH && y < GLYPH_GRID_HEIGHT {
            let offset = ((GLYPH_GRID_Y + y) * WIDTH + x) * 4;
            let intensity = self.pixels[offset];
            if intensity > 0 {
                // Return the ASCII character (including space)
                intensity as char
            } else {
                // Null or zero = treat as space for pattern matching
                ' '
            }
        } else {
            '\0'
        }
    }

    /// Detect [X] button patterns in glyph grid
    ///
    /// Scans the glyph grid for patterns like "[R] Run" or "[Q] Quit"
    /// and returns a list of detected patterns with their positions,
    /// labels, and associated actions.
    pub fn detect_patterns(&self) -> Vec<Pattern> {
        let mut patterns = Vec::new();
        let re = Regex::new(r"\[([A-Z0-9])\]\s*(\w+)").unwrap();

        for y in 0..GLYPH_GRID_HEIGHT {
            // Build line string from glyph grid
            let mut line = String::new();
            for x in 0..WIDTH {
                line.push(self.get_glyph(x, y));
            }

            // Find all pattern matches in this line
            for cap in re.captures_iter(&line) {
                let label = cap[1].chars().next().unwrap();
                let action = cap[2].to_string();

                // Find x position of the pattern start
                let pattern_str = format!("[{}]", label);
                if let Some(x) = line.find(&pattern_str) {
                    patterns.push(Pattern {
                        x: x as u32,
                        y: y as u32,
                        label,
                        action,
                    });
                }
            }
        }

        patterns
    }

    /// Apply action mapping to SIT entries based on detected patterns
    ///
    /// For each detected pattern, looks up the action in the action_map
    /// and sets the corresponding SIT entry with the opcode and target address.
    ///
    /// # Arguments
    /// * `action_map` - Maps action names to (opcode_name, target_label) tuples
    /// * `labels` - Maps label names to target addresses
    pub fn apply_action_mapping(
        &mut self,
        action_map: &HashMap<&str, (&str, &str)>,
        labels: &HashMap<String, u32>,
    ) {
        let patterns = self.detect_patterns();

        for pattern in patterns {
            if let Some(&(opcode_name, target)) = action_map.get(pattern.action.as_str()) {
                // Convert opcode name to bytecode
                let opcode: u8 = match opcode_name {
                    "JUMP" => 9,
                    "CALL" => 11,
                    "EXIT" => 13,
                    _ => 0,
                };

                // Get target address from labels
                let target_addr = labels.get(target).copied().unwrap_or(0) as u16;

                // Calculate SIT index from pattern position
                let idx = (pattern.y * WIDTH as u32 + pattern.x) as usize;
                self.set_sit(idx, opcode, target_addr);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dimensions() {
        assert_eq!(WIDTH, 80);
        assert_eq!(TOTAL_HEIGHT, 1576);
        assert_eq!(
            TOTAL_HEIGHT,
            GLYPH_GRID_HEIGHT
                + SIT_HEIGHT
                + STATE_BUFFER_HEIGHT
                + BOOTSTRAP_HEIGHT
                + PROGRAM_HEIGHT
        );
    }

    #[test]
    fn test_segment_offsets() {
        assert_eq!(GLYPH_GRID_Y, 0);
        assert_eq!(SIT_Y, 24);
        assert_eq!(STATE_BUFFER_Y, 280);
        assert_eq!(BOOTSTRAP_Y, 1304);
        assert_eq!(PROGRAM_Y, 1320);
    }
}
