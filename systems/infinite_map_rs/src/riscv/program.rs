//! RISC-V Program Loader Module
//!
//! This module provides functionality for loading RISC-V programs encoded
//! in the .rts.png format (RGBA PNG images containing machine code).

use anyhow::Result;
use image::ImageReader;
use serde::{Deserialize, Serialize};
use std::path::Path;

/// Convert Hilbert curve index to 2D coordinates
fn hilbert_to_2d(index: u32, order: u32) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;

    for s in 0..order {
        let rx = (index >> (2 * s)) & 1;
        let ry = (index >> (2 * s + 1)) & 1;

        // Rotate/flip quadrant
        if ry == 0 {
            if rx == 1 {
                x = (1u32 << s) - 1 - x;
                y = (1u32 << s) - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += rx * (1u32 << s);
        y += ry * (1u32 << s);
    }

    (x, y)
}

/// A RISC-V program loaded from an .rts.png file
#[derive(Debug, Clone)]
pub struct RiscvProgram {
    /// Entry point address (usually 0x80000000 or higher)
    pub entry_point: u32,
    /// RISC-V instructions (32-bit words in little-endian format)
    pub code: Vec<u32>,
    /// Program metadata from sidecar JSON file
    pub metadata: ProgramMetadata,
}

/// Metadata associated with an .rts.png program
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProgramMetadata {
    /// Format identifier (e.g., "rts_raw_riscv")
    pub format: String,
    /// Version string
    pub version: String,
    /// Architecture (e.g., "riscv32")
    pub architecture: String,
    /// Grid size (width of the texture in pixels)
    pub grid_size: u32,
    /// Hilbert curve order for decoding
    #[serde(default)]
    pub hilbert_order: u32,
    /// Number of instructions in the code
    pub code_size: usize,
    /// Entry point in hex format (e.g., "0x80000000")
    #[serde(default)]
    pub entry_point: String,
}

impl RiscvProgram {
    /// Load a RISC-V program from an .rts.png file
    ///
    /// The .rts.png format stores 32-bit RISC-V instructions in RGBA pixels.
    /// Each pixel contains one 32-bit word in little-endian byte order.
    /// Metadata is loaded from a corresponding .rts.meta.json file.
    ///
    /// # Arguments
    /// * `path` - Path to the .rts.png file
    ///
    /// # Returns
    /// A `RiscvProgram` containing the loaded code and metadata
    ///
    /// # Example
    /// ```no_run
    /// use infinite_map_rs::riscv::RiscvProgram;
    /// # use anyhow::Result;
    /// # fn main() -> Result<()> {
    /// let program = RiscvProgram::load_from_rts("tests/minimal_test.rts.png")?;
    /// println!("Loaded {} instructions", program.code.len());
    /// # Ok(())
    /// # }
    /// ```
    pub fn load_from_rts<P: AsRef<Path>>(path: P) -> Result<Self> {
        let path = path.as_ref();

        // Load PNG image
        let img = ImageReader::open(path)?.decode()?;
        let rgba = img.to_rgba8();
        let (width, height) = rgba.dimensions();

        // Load metadata from JSON sidecar
        let meta_path = path.with_extension("rts.meta.json");
        let metadata = if meta_path.exists() {
            let json_str = std::fs::read_to_string(&meta_path)?;
            serde_json::from_str::<ProgramMetadata>(&json_str)?
        } else {
            ProgramMetadata {
                format: "rts_raw_riscv".to_string(),
                version: "1.0".to_string(),
                architecture: "riscv32".to_string(),
                grid_size: width as u32,
                hilbert_order: 0,
                code_size: 0,
                entry_point: String::new(),
            }
        };

        // Calculate Hilbert order from grid size
        let order = if metadata.hilbert_order > 0 {
            metadata.hilbert_order
        } else {
            let mut o = 0u32;
            while (1u32 << o) < width {
                o += 1;
            }
            o
        };

        // Extract 32-bit words from RGBA pixels using Hilbert curve order
        // Each pixel contains one 32-bit word in little-endian byte order
        let total_pixels = (width * height) as usize;
        let mut code = Vec::with_capacity(total_pixels);

        for i in 0..total_pixels {
            // Convert Hilbert index to 2D coordinates
            let (x, y) = hilbert_to_2d(i as u32, order);
            if x < width && y < height {
                let pixel = rgba.get_pixel(x, y);
                let word = u32::from_le_bytes([pixel[0], pixel[1], pixel[2], pixel[3]]);
                code.push(word);
            }
        }

        // Trim trailing zeros
        while let Some(&0) = code.last() {
            code.pop();
        }

        // Parse entry point from metadata
        let entry_point = if !metadata.entry_point.is_empty() {
            let hex_str = metadata.entry_point.trim_start_matches("0x");
            u32::from_str_radix(hex_str, 16)?
        } else {
            0x80000000 // Default entry point
        };

        Ok(Self {
            entry_point,
            code,
            metadata,
        })
    }

    /// Get the size of the code in bytes
    pub fn code_size_bytes(&self) -> usize {
        self.code.len() * 4
    }

    /// Convert code bytes to a vector of u8
    pub fn code_bytes(&self) -> Vec<u8> {
        self.code
            .iter()
            .flat_map(|&w| w.to_le_bytes().to_vec())
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_load_rts_program() {
        let program_path = "../../riscv_gpu/tests/minimal_test.rts.png";

        // Skip test if file doesn't exist
        if !std::path::Path::new(program_path).exists() {
            println!("Skipping test_load_rts_program - file not found");
            return;
        }

        let program =
            RiscvProgram::load_from_rts(program_path).expect("Failed to load RTS program");

        assert_eq!(program.entry_point, 0x800000f8);
        assert!(!program.code.is_empty());
        assert_eq!(program.metadata.architecture, "riscv32");
    }

    #[test]
    fn test_riscv_program_struct_exists() {
        // Basic compilation test
        let metadata = ProgramMetadata {
            format: "test".to_string(),
            version: "1.0".to_string(),
            architecture: "riscv32".to_string(),
            grid_size: 16,
            hilbert_order: 4,
            code_size: 0,
            entry_point: String::new(),
        };
        let program = RiscvProgram {
            entry_point: 0x80000000,
            code: vec![0x13, 0x00000537], // addi x0, x0, 0; auipc x0, 0
            metadata,
        };
        assert_eq!(program.entry_point, 0x80000000);
        assert_eq!(program.code.len(), 2);
    }

    #[test]
    fn test_code_size_bytes() {
        let metadata = ProgramMetadata {
            format: "test".to_string(),
            version: "1.0".to_string(),
            architecture: "riscv32".to_string(),
            grid_size: 16,
            hilbert_order: 4,
            code_size: 0,
            entry_point: String::new(),
        };
        let program = RiscvProgram {
            entry_point: 0x80000000,
            code: vec![0x13, 0x0537],
            metadata,
        };
        assert_eq!(program.code_size_bytes(), 8); // 2 instructions * 4 bytes
    }

    #[test]
    fn test_code_bytes_conversion() {
        let metadata = ProgramMetadata {
            format: "test".to_string(),
            version: "1.0".to_string(),
            architecture: "riscv32".to_string(),
            grid_size: 16,
            hilbert_order: 4,
            code_size: 0,
            entry_point: String::new(),
        };
        // 0x12345678 in little-endian is [0x78, 0x56, 0x34, 0x12]
        let program = RiscvProgram {
            entry_point: 0x80000000,
            code: vec![0x12345678],
            metadata,
        };
        let bytes = program.code_bytes();
        assert_eq!(bytes, vec![0x78, 0x56, 0x34, 0x12]);
    }
}
