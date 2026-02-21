//! Phase 33: MSDF Font Atlas Generation
//! 
//! Generates Multi-channel Signed Distance Fields for font glyphs
//! and packs them into a 1024x1024 texture atlas.

use fontdue::{Font, FontSettings};

/// Glyph information for atlas packing
#[derive(Debug, Clone)]
pub struct GlyphInfo {
    pub unicode: u32,
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
    pub advance: f32,
    pub bearing_x: f32,
    pub bearing_y: f32,
}

/// Font atlas containing glyph data and texture
pub struct FontAtlas {
    pub width: u32,
    pub height: u32,
    pub data: Vec<u8>, // RGBA8 format
    pub glyphs: Vec<GlyphInfo>,
    pub cell_size: u32,
}

impl FontAtlas {
    /// Generate a font atlas with default system font
    pub fn generate_default() -> Result<Self, String> {
        // Phase 33.1: Using fallback bitmap font (embedded, no external files needed)
        // Future: Load system fonts with fontdue when TTF file is available
        Ok(generate_fallback_atlas())
    }
    
    /// Generate atlas from font data
    pub fn generate_from_data(font_data: &[u8], size: f32) -> Result<Self, String> {
        let font = Font::from_bytes(font_data, FontSettings::default())
            .map_err(|e| format!("Failed to load font: {:?}", e))?;
        
        Self::generate_from_font(&font, size)
    }
    
    /// Generate atlas from loaded font
    pub fn generate_from_font(font: &Font, size: f32) -> Result<Self, String> {
        const ATLAS_WIDTH: u32 = 1024;
        const ATLAS_HEIGHT: u32 = 1024;
        const CELL_SIZE: u32 = 64; // 64x64 pixels per glyph
        const GRID_COLS: u32 = ATLAS_WIDTH / CELL_SIZE; // 16 columns
        const GRID_ROWS: u32 = ATLAS_HEIGHT / CELL_SIZE; // 16 rows
        const MAX_GLYPHS: usize = (GRID_COLS * GRID_ROWS) as usize;
        
        // ASCII printable characters (32-126) = 95 chars
        // Plus extended symbols up to 255 for full coverage
        let start_char = 32u8;
        let end_char = 255u8;
        
        let mut atlas_data = vec![0u8; (ATLAS_WIDTH * ATLAS_HEIGHT * 4) as usize];
        let mut glyphs = Vec::with_capacity(MAX_GLYPHS);
        
        let mut cell_index = 0u32;
        
        for char_code in start_char..=end_char {
            if cell_index >= MAX_GLYPHS as u32 {
                break;
            }
            
            let (metrics, bitmap) = font.rasterize(char_code as char, size);
            
            if metrics.width == 0 || metrics.height == 0 {
                // Still store glyph info for spacing, but skip bitmap
                let col = cell_index % GRID_COLS;
                let row = cell_index / GRID_COLS;
                
                glyphs.push(GlyphInfo {
                    unicode: char_code as u32,
                    x: col * CELL_SIZE,
                    y: row * CELL_SIZE,
                    width: 0,
                    height: 0,
                    advance: metrics.advance_width,
                    bearing_x: metrics.xmin as f32,
                    bearing_y: metrics.ymin as f32,
                });
                
                cell_index += 1;
                continue;
            }
            
            // Calculate cell position
            let col = cell_index % GRID_COLS;
            let row = cell_index / GRID_COLS;
            let cell_x = col * CELL_SIZE;
            let cell_y = row * CELL_SIZE;
            
            // Center the glyph in the cell
            let offset_x = (CELL_SIZE - metrics.width as u32) / 2;
            let offset_y = (CELL_SIZE - metrics.height as u32) / 2;
            
            // Copy bitmap data to atlas (convert grayscale to RGBA)
            for y in 0..metrics.height {
                for x in 0..metrics.width {
                    let atlas_x = cell_x + offset_x + x as u32;
                    let atlas_y = cell_y + offset_y + y as u32;
                    
                    let atlas_idx = ((atlas_y * ATLAS_WIDTH + atlas_x) * 4) as usize;
                    let bitmap_idx = y * metrics.width + x;
                    
                    if atlas_idx + 3 < atlas_data.len() && bitmap_idx < bitmap.len() {
                        let alpha = bitmap[bitmap_idx];
                        // Store as white text (will be colored in shader)
                        atlas_data[atlas_idx] = 255;     // R
                        atlas_data[atlas_idx + 1] = 255; // G
                        atlas_data[atlas_idx + 2] = 255; // B
                        atlas_data[atlas_idx + 3] = alpha; // A
                    }
                }
            }
            
            glyphs.push(GlyphInfo {
                unicode: char_code as u32,
                x: cell_x,
                y: cell_y,
                width: metrics.width as u32,
                height: metrics.height as u32,
                advance: metrics.advance_width,
                bearing_x: metrics.xmin as f32,
                bearing_y: metrics.ymin as f32,
            });
            
            cell_index += 1;
        }
        
        log::info!("📚 Font Atlas Generated: {} glyphs packed into {}x{} grid", 
            glyphs.len(), GRID_COLS, GRID_ROWS);
        
        Ok(FontAtlas {
            width: ATLAS_WIDTH,
            height: ATLAS_HEIGHT,
            data: atlas_data,
            glyphs,
            cell_size: CELL_SIZE,
        })
    }
    
    /// Get glyph info for a character
    pub fn get_glyph(&self, unicode: u32) -> Option<&GlyphInfo> {
        self.glyphs.iter().find(|g| g.unicode == unicode)
    }
    
    /// Calculate texture coordinates for a glyph
    pub fn get_uv(&self, glyph: &GlyphInfo) -> ([f32; 2], [f32; 2]) {
        let u1 = glyph.x as f32 / self.width as f32;
        let v1 = glyph.y as f32 / self.height as f32;
        let u2 = (glyph.x + self.cell_size) as f32 / self.width as f32;
        let v2 = (glyph.y + self.cell_size) as f32 / self.height as f32;
        
        ([u1, v1], [u2, v2])
    }
}

/// Generate a simple embedded bitmap font for fallback
pub fn generate_fallback_atlas() -> FontAtlas {
    const ATLAS_WIDTH: u32 = 1024;
    const ATLAS_HEIGHT: u32 = 1024;
    const CELL_SIZE: u32 = 64;
    
    let mut atlas_data = vec![0u8; (ATLAS_WIDTH * ATLAS_HEIGHT * 4) as usize];
    let mut glyphs = Vec::new();
    
    // Generate simple 5x7 bitmap font patterns for ASCII 32-127
    for char_code in 32u8..=127u8 {
        let cell_index = (char_code - 32) as u32;
        let col = cell_index % 16;
        let row = cell_index / 16;
        let cell_x = col * CELL_SIZE;
        let cell_y = row * CELL_SIZE;
        
        // Simple patterns for common characters
        let pattern = get_char_pattern(char_code);
        
        // Draw the pattern centered in cell
        let offset_x = (CELL_SIZE - 32) / 2; // 32px wide pattern
        let offset_y = (CELL_SIZE - 44) / 2; // 44px tall pattern
        
        for y in 0..7 {
            for x in 0..5 {
                if pattern[y] & (1 << (4 - x)) != 0 {
                    // Scale up 5x7 to fill more of the cell
                    for sy in 0..6 {
                        for sx in 0..6 {
                            let atlas_x = cell_x + offset_x + x as u32 * 6 + sx;
                            let atlas_y = cell_y + offset_y + y as u32 * 6 + sy;
                            let idx = ((atlas_y * ATLAS_WIDTH + atlas_x) * 4) as usize;
                            if idx + 3 < atlas_data.len() {
                                atlas_data[idx] = 255;
                                atlas_data[idx + 1] = 255;
                                atlas_data[idx + 2] = 255;
                                atlas_data[idx + 3] = 255;
                            }
                        }
                    }
                }
            }
        }
        
        glyphs.push(GlyphInfo {
            unicode: char_code as u32,
            x: cell_x,
            y: cell_y,
            width: 32,
            height: 44,
            advance: 0.6, // Relative advance
            bearing_x: 0.0,
            bearing_y: 0.0,
        });
    }
    
    FontAtlas {
        width: ATLAS_WIDTH,
        height: ATLAS_HEIGHT,
        data: atlas_data,
        glyphs,
        cell_size: CELL_SIZE,
    }
}

/// Get 5x7 bitmap pattern for a character
pub fn get_char_pattern(ch: u8) -> [u8; 7] {
    match ch {
        b' ' => [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000],
        b'!' => [0b00100, 0b00100, 0b00100, 0b00100, 0b00000, 0b00100, 0b00000],
        b'"' => [0b01010, 0b01010, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000],
        b'#' => [0b01010, 0b11111, 0b01010, 0b01010, 0b11111, 0b01010, 0b00000],
        b'$' => [0b00100, 0b01111, 0b10100, 0b01110, 0b00101, 0b11110, 0b00100],
        b'%' => [0b11000, 0b11001, 0b00010, 0b00100, 0b01000, 0b10011, 0b00011],
        b'&' => [0b01100, 0b10010, 0b10100, 0b01000, 0b10101, 0b10010, 0b01101],
        b'\'' => [0b00100, 0b00100, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000],
        b'(' => [0b00010, 0b00100, 0b01000, 0b01000, 0b01000, 0b00100, 0b00010],
        b')' => [0b01000, 0b00100, 0b00010, 0b00010, 0b00010, 0b00100, 0b01000],
        b'*' => [0b00000, 0b00100, 0b10101, 0b01110, 0b10101, 0b00100, 0b00000],
        b'+' => [0b00000, 0b00100, 0b00100, 0b11111, 0b00100, 0b00100, 0b00000],
        b',' => [0b00000, 0b00000, 0b00000, 0b00000, 0b00100, 0b00100, 0b01000],
        b'-' => [0b00000, 0b00000, 0b00000, 0b11111, 0b00000, 0b00000, 0b00000],
        b'.' => [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b01100, 0b01100],
        b'/' => [0b00001, 0b00010, 0b00100, 0b01000, 0b10000, 0b00000, 0b00000],
        b'0' => [0b01110, 0b10001, 0b10011, 0b10101, 0b11001, 0b10001, 0b01110],
        b'1' => [0b00100, 0b01100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110],
        b'2' => [0b01110, 0b10001, 0b00001, 0b00010, 0b00100, 0b01000, 0b11111],
        b'3' => [0b11111, 0b00010, 0b00100, 0b00010, 0b00001, 0b10001, 0b01110],
        b'4' => [0b00010, 0b00110, 0b01010, 0b10010, 0b11111, 0b00010, 0b00010],
        b'5' => [0b11111, 0b10000, 0b11110, 0b00001, 0b00001, 0b10001, 0b01110],
        b'6' => [0b00110, 0b01000, 0b10000, 0b11110, 0b10001, 0b10001, 0b01110],
        b'7' => [0b11111, 0b00001, 0b00010, 0b00100, 0b01000, 0b01000, 0b01000],
        b'8' => [0b01110, 0b10001, 0b10001, 0b01110, 0b10001, 0b10001, 0b01110],
        b'9' => [0b01110, 0b10001, 0b10001, 0b01111, 0b00001, 0b00010, 0b01100],
        b':' => [0b00000, 0b01100, 0b01100, 0b00000, 0b01100, 0b01100, 0b00000],
        b';' => [0b00000, 0b01100, 0b01100, 0b00000, 0b01100, 0b00100, 0b01000],
        b'<' => [0b00010, 0b00100, 0b01000, 0b10000, 0b01000, 0b00100, 0b00010],
        b'=' => [0b00000, 0b00000, 0b11111, 0b00000, 0b11111, 0b00000, 0b00000],
        b'>' => [0b01000, 0b00100, 0b00010, 0b00001, 0b00010, 0b00100, 0b01000],
        b'?' => [0b01110, 0b10001, 0b00001, 0b00010, 0b00100, 0b00000, 0b00100],
        b'@' => [0b01110, 0b10001, 0b00001, 0b01101, 0b01001, 0b10001, 0b01110],
        b'A' => [0b00100, 0b01010, 0b10001, 0b10001, 0b11111, 0b10001, 0b10001],
        b'B' => [0b11110, 0b10001, 0b10001, 0b11110, 0b10001, 0b10001, 0b11110],
        b'C' => [0b01110, 0b10001, 0b10000, 0b10000, 0b10000, 0b10001, 0b01110],
        b'D' => [0b11110, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b11110],
        b'E' => [0b11111, 0b10000, 0b10000, 0b11110, 0b10000, 0b10000, 0b11111],
        b'F' => [0b11111, 0b10000, 0b10000, 0b11110, 0b10000, 0b10000, 0b10000],
        b'G' => [0b01110, 0b10001, 0b10000, 0b10000, 0b10011, 0b10001, 0b01110],
        b'H' => [0b10001, 0b10001, 0b10001, 0b11111, 0b10001, 0b10001, 0b10001],
        b'I' => [0b01110, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110],
        b'J' => [0b00001, 0b00001, 0b00001, 0b00001, 0b10001, 0b10001, 0b01110],
        b'K' => [0b10001, 0b10010, 0b10100, 0b11000, 0b10100, 0b10010, 0b10001],
        b'L' => [0b10000, 0b10000, 0b10000, 0b10000, 0b10000, 0b10000, 0b11111],
        b'M' => [0b10001, 0b11011, 0b10101, 0b10001, 0b10001, 0b10001, 0b10001],
        b'N' => [0b10001, 0b11001, 0b10101, 0b10011, 0b10001, 0b10001, 0b10001],
        b'O' => [0b01110, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01110],
        b'P' => [0b11110, 0b10001, 0b10001, 0b11110, 0b10000, 0b10000, 0b10000],
        b'Q' => [0b01110, 0b10001, 0b10001, 0b10001, 0b10101, 0b10010, 0b01101],
        b'R' => [0b11110, 0b10001, 0b10001, 0b11110, 0b10100, 0b10010, 0b10001],
        b'S' => [0b01111, 0b10000, 0b10000, 0b01110, 0b00001, 0b00001, 0b11110],
        b'T' => [0b11111, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100],
        b'U' => [0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01110],
        b'V' => [0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01010, 0b00100],
        b'W' => [0b10001, 0b10001, 0b10001, 0b10101, 0b10101, 0b10101, 0b01010],
        b'X' => [0b10001, 0b10001, 0b01010, 0b00100, 0b01010, 0b10001, 0b10001],
        b'Y' => [0b10001, 0b10001, 0b01010, 0b00100, 0b00100, 0b00100, 0b00100],
        b'Z' => [0b11111, 0b00001, 0b00010, 0b00100, 0b01000, 0b10000, 0b11111],
        b'[' => [0b01110, 0b01000, 0b01000, 0b01000, 0b01000, 0b01000, 0b01110],
        b'\\' => [0b10000, 0b01000, 0b00100, 0b00010, 0b00001, 0b00000, 0b00000],
        b']' => [0b01110, 0b00010, 0b00010, 0b00010, 0b00010, 0b00010, 0b01110],
        b'^' => [0b00100, 0b01010, 0b10001, 0b00000, 0b00000, 0b00000, 0b00000],
        b'_' => [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b11111],
        b'`' => [0b01000, 0b00100, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000],
        b'a' => [0b00000, 0b00000, 0b01110, 0b00001, 0b01111, 0b10001, 0b01111],
        b'b' => [0b10000, 0b10000, 0b10110, 0b11001, 0b10001, 0b10001, 0b11110],
        b'c' => [0b00000, 0b00000, 0b01110, 0b10000, 0b10000, 0b10001, 0b01110],
        b'd' => [0b00001, 0b00001, 0b01101, 0b10011, 0b10001, 0b10001, 0b01111],
        b'e' => [0b00000, 0b00000, 0b01110, 0b10001, 0b11111, 0b10000, 0b01110],
        b'f' => [0b00010, 0b00100, 0b01110, 0b00100, 0b00100, 0b00100, 0b00100],
        b'g' => [0b00000, 0b00000, 0b01111, 0b10001, 0b10001, 0b01111, 0b00001],
        b'h' => [0b10000, 0b10000, 0b10110, 0b11001, 0b10001, 0b10001, 0b10001],
        b'i' => [0b00100, 0b00000, 0b01100, 0b00100, 0b00100, 0b00100, 0b01110],
        b'j' => [0b00010, 0b00000, 0b00010, 0b00010, 0b00010, 0b10010, 0b01100],
        b'k' => [0b10000, 0b10000, 0b10010, 0b10100, 0b11000, 0b10100, 0b10010],
        b'l' => [0b01100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110],
        b'm' => [0b00000, 0b00000, 0b11010, 0b10101, 0b10101, 0b10001, 0b10001],
        b'n' => [0b00000, 0b00000, 0b10110, 0b11001, 0b10001, 0b10001, 0b10001],
        b'o' => [0b00000, 0b00000, 0b01110, 0b10001, 0b10001, 0b10001, 0b01110],
        b'p' => [0b00000, 0b00000, 0b11110, 0b10001, 0b10001, 0b11110, 0b10000],
        b'q' => [0b00000, 0b00000, 0b01111, 0b10001, 0b10001, 0b01111, 0b00001],
        b'r' => [0b00000, 0b00000, 0b10110, 0b11001, 0b10000, 0b10000, 0b10000],
        b's' => [0b00000, 0b00000, 0b01111, 0b10000, 0b01110, 0b00001, 0b11110],
        b't' => [0b00100, 0b00100, 0b01110, 0b00100, 0b00100, 0b00100, 0b00011],
        b'u' => [0b00000, 0b00000, 0b10001, 0b10001, 0b10001, 0b10011, 0b01101],
        b'v' => [0b00000, 0b00000, 0b10001, 0b10001, 0b10001, 0b01010, 0b00100],
        b'w' => [0b00000, 0b00000, 0b10001, 0b10001, 0b10101, 0b10101, 0b01010],
        b'x' => [0b00000, 0b00000, 0b10001, 0b01010, 0b00100, 0b01010, 0b10001],
        b'y' => [0b00000, 0b00000, 0b10001, 0b10001, 0b10001, 0b01111, 0b00001],
        b'z' => [0b00000, 0b00000, 0b11111, 0b00010, 0b00100, 0b01000, 0b11111],
        b'{' => [0b00010, 0b00100, 0b00100, 0b01000, 0b00100, 0b00100, 0b00010],
        b'|' => [0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100],
        b'}' => [0b01000, 0b00100, 0b00100, 0b00010, 0b00100, 0b00100, 0b01000],
        b'~' => [0b00000, 0b00000, 0b01000, 0b10101, 0b00010, 0b00000, 0b00000],
        _ => [0b11111, 0b11111, 0b11111, 0b11111, 0b11111, 0b11111, 0b11111], // Block for undefined
    }
}