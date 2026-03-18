//! Glyph Program Loader
//!
//! Loads .glyph files into GPU buffer for VM execution.

use std::fs;
use std::path::Path;
use log::info;

/// Loaded glyph program ready for GPU upload
pub struct GlyphProgram {
    pub data: Vec<u32>,
    pub entry_point: u32,
}

impl GlyphProgram {
    /// Load a .glyph file (binary u32 words)
    pub fn from_file<P: AsRef<Path>>(path: P) -> Result<Self, String> {
        let path = path.as_ref();
        info!("Loading glyph program: {}", path.display());

        let bytes = fs::read(path)
            .map_err(|e| format!("Failed to read {}: {}", path.display(), e))?;

        // Convert bytes to u32 words (little-endian)
        if bytes.len() % 4 != 0 {
            return Err("Glyph file size must be multiple of 4 bytes".to_string());
        }

        let data: Vec<u32> = bytes
            .chunks_exact(4)
            .map(|chunk| u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]))
            .collect();

        info!("Loaded {} u32 words from {}", data.len(), path.display());

        Ok(Self {
            data,
            entry_point: 0, // Default entry point
        })
    }

    /// Load from raw u32 data
    pub fn from_words(words: Vec<u32>) -> Self {
        Self {
            data: words,
            entry_point: 0,
        }
    }

    /// Create a simple test program (LDI r0, 42; HALT)
    pub fn test_program() -> Self {
        // Opcode format: (opcode << 24) | (rd << 16) | imm16
        // LDI r0, 42 = (1 << 24) | (0 << 16) | 42 = 0x0100002A
        // HALT = 13 << 24 = 0x0D000000
        Self {
            data: vec![0x0100002A, 0x0D000000],
            entry_point: 0,
        }
    }

    /// Get bytes for GPU upload
    pub fn as_bytes(&self) -> Vec<u8> {
        self.data
            .iter()
            .flat_map(|word| word.to_le_bytes())
            .collect()
    }

    /// Get word count
    pub fn word_count(&self) -> usize {
        self.data.len()
    }
}

/// Glyph file format detection
pub fn detect_format<P: AsRef<Path>>(path: P) -> GlyphFormat {
    let path = path.as_ref();
    match path.extension().and_then(|s| s.to_str()) {
        Some("glyph") => GlyphFormat::Binary,
        Some("gasm") => GlyphFormat::Assembly,
        _ => GlyphFormat::Unknown,
    }
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum GlyphFormat {
    Binary,
    Assembly,
    Unknown,
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    use tempfile::NamedTempFile;

    #[test]
    fn test_test_program() {
        let prog = GlyphProgram::test_program();
        assert_eq!(prog.word_count(), 2);
        assert_eq!(prog.data[0], 0x0100002A); // LDI r0, 42
        assert_eq!(prog.data[1], 0x0D000000); // HALT
    }

    #[test]
    fn test_as_bytes() {
        let prog = GlyphProgram::test_program();
        let bytes = prog.as_bytes();
        assert_eq!(bytes.len(), 8); // 2 words * 4 bytes
    }

    #[test]
    fn test_from_file() {
        let mut file = NamedTempFile::new().unwrap();
        // Write 2 u32 words
        file.write_all(&0x0100002Au32.to_le_bytes()).unwrap();
        file.write_all(&0x0D000000u32.to_le_bytes()).unwrap();
        file.flush().unwrap();

        let prog = GlyphProgram::from_file(file.path()).unwrap();
        assert_eq!(prog.word_count(), 2);
    }
}
