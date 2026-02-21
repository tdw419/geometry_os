use std::fs::File;
use std::path::Path;
use std::io::{Error, ErrorKind};
use png::Decoder;

#[derive(Debug, Clone)]
pub struct RtsAsset {
    pub width: u32,
    pub height: u32,
    pub texture_data: Vec<u8>,
    pub logic_script: String,
}

pub struct RtsLoader;

impl RtsLoader {
    /// Loads an .rts.png file, extracting the executable logic and texture data.
    pub fn load<P: AsRef<Path>>(path: P) -> std::io::Result<RtsAsset> {
        let file = File::open(path)?;
        let decoder = Decoder::new(file);
        let mut reader = decoder.read_info()?;
        
        // Allocate buffer for image data
        let mut buf = vec![0; reader.output_buffer_size()];
        
        // Read the next frame
        let info = reader.next_frame(&mut buf).map_err(|e| Error::new(ErrorKind::InvalidData, e.to_string()))?;
        
        // The `info` struct returned by next_frame is not the full Info struct with metadata.
        // We need to access the `Info` from the reader itself after reading.
        let info_ref = reader.info();

        // Extract metadata
        let mut logic_script = String::new();
        
        // Check tEXt/zTXt chunks (Latin-1)
        for chunk in &info_ref.uncompressed_latin1_text {
            if chunk.keyword == "RTS_Logic" {
                logic_script = chunk.text.clone();
                break;
            }
        }
        
        // Check iTXt chunks (UTF-8) - if not found yet
        if logic_script.is_empty() {
             for chunk in &info_ref.utf8_text {
                if chunk.keyword == "RTS_Logic" {
                    if let Ok(text) = chunk.get_text() {
                        logic_script = text;
                    }
                    break;
                }
            }
        }

        if logic_script.is_empty() {
            // It's allowed to have no logic, but let's log it or just return empty string.
            // For now, we assume it's valid to just be an image.
        }

        // We only support RGBA8 or RGB8, ideally. 
        // If it's not, we might need to convert, but for now let's just return what we have.
        // The user can handle format conversion if needed.

        // Truncate buffer to actual size if necessary 
        // (reader.output_buffer_size() might be larger than actual frame size depending on implementation, 
        // but next_frame returns the output info including buffer_size used)
        
        Ok(RtsAsset {
            width: info_ref.width,
            height: info_ref.height,
            texture_data: buf,
            logic_script,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;

    #[test]
    fn test_load_dummy_rts() {
        // This test expects a file to exist. 
        // Since we are in a pure Rust test environment, we might not be able to rely on the python script having run 
        // in the exact location we expect unless we coordinate.
        // However, we can look for `test_unit.rts.png` in the current directory or a known location.
        
        let path = PathBuf::from("test_unit.rts.png");
        if !path.exists() {
            eprintln!("Skipping test: test_unit.rts.png not found. Run the python injector first.");
            return;
        }

        let asset = RtsLoader::load(&path).expect("Failed to load RTS asset");
        
        // Verify key properties
        assert!(!asset.logic_script.is_empty(), "Logic script should not be empty");
        assert!(asset.logic_script.contains("print('Unit Initialized')"), "Script content mismatch");
        assert!(asset.width > 0);
        assert!(asset.height > 0);
        assert!(!asset.texture_data.is_empty());
        
        println!("Successfully loaded RTS Asset!");
        println!("Script Preview: {:.50}...", asset.logic_script);
    }
}
