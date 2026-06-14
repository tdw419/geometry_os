//! RISC-V Native Program Loader
//!
//! Loads RISC-V programs encoded in .rts.png format.

use anyhow::Result;
use image::ImageReader;
use std::path::Path;

#[derive(Debug, Clone)]
pub struct NativeRiscvProgram {
    pub entry_point: u32,
    pub code: Vec<u32>,
    pub texture_size: u32,
}

impl NativeRiscvProgram {
    /// Load a RISC-V program from an .rts.png file
    ///
    /// # Arguments
    /// * `path` - Path to the .rts.png file
    ///
    /// # Returns
    /// A `NativeRiscvProgram` with entry point, code, and texture size
    pub fn load_from_rts<P: AsRef<Path>>(path: P) -> Result<Self> {
        let path = path.as_ref();

        // Load PNG image
        let img = ImageReader::open(path)?.decode()?;
        let rgba = img.to_rgba8();
        let (width, height) = rgba.dimensions();

        // Load metadata
        let meta_path = path.with_extension("rts.meta.json");
        let entry_point = if meta_path.exists() {
            let json = std::fs::read_to_string(&meta_path)?;
            let value: serde_json::Value = serde_json::from_str(&json)?;
            let ep_str = value["entry_point"].as_str().unwrap_or("0x80000000");
            u32::from_str_radix(ep_str.trim_start_matches("0x"), 16)?
        } else {
            0x80000000
        };

        // Extract 32-bit words from RGBA pixels
        // Each pixel contains one 32-bit word in little-endian byte order
        let mut code = Vec::with_capacity((width * height) as usize);
        for y in 0..height {
            for x in 0..width {
                let pixel = rgba.get_pixel(x, y);
                let word = u32::from_le_bytes([pixel[0], pixel[1], pixel[2], pixel[3]]);
                code.push(word);
            }
        }

        // Trim trailing zeros
        while let Some(&0) = code.last() {
            code.pop();
        }

        Ok(Self {
            entry_point,
            code,
            texture_size: width as u32,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_load_rts_program() {
        let program_path = "../../riscv_gpu/tests/minimal_test.rts.png";

        if !std::path::Path::new(program_path).exists() {
            println!("Skipping test - program file not found at {}", program_path);
            return;
        }

        let program =
            NativeRiscvProgram::load_from_rts(program_path).expect("Failed to load program");

        assert_eq!(program.entry_point, 0x800000f8);
        assert!(!program.code.is_empty());
        assert_eq!(program.texture_size, 16);
    }
}
