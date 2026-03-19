//! Self-Hosting Cartridge Generator
//!
//! Generates GPU-native .rts.png cartridges from ASCII assembly source.
//! Combines template rendering, assembly, and cartridge writing into
//! a single pipeline for the self-hosting compiler UI.

use std::collections::HashMap;
use std::fs::File;
use std::io::Write;
use std::path::Path;

use super::self_hosting_template::SelfHostingTemplate;
use crate::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use crate::glyph_assembler::GlyphAssembler;

/// Generate a self-hosting cartridge from ASCII assembly source
///
/// # Arguments
/// * `source` - ASCII assembly source code to compile
/// * `output_path` - Path to write the .rts.png cartridge file
///
/// # Returns
/// Ok(()) on success, Err with message on failure
///
/// # Example
/// ```ignore
/// use infinite_map_rs::ascii_native::self_hosting_cartridge::generate_self_hosting_cartridge;
///
/// let source = "LDI r0, 42\nHALT";
/// generate_self_hosting_cartridge(source, "output.rts.png").unwrap();
/// ```
pub fn generate_self_hosting_cartridge<P: AsRef<Path>>(
    source: &str,
    output_path: P,
) -> Result<(), String> {
    // 1. Render ASCII template with source lines
    let template = SelfHostingTemplate::load()?;
    let source_lines: Vec<&str> = source.lines().collect();
    let display_text = template.render("Ready", &source_lines);

    // 2. Assemble the program with GlyphAssembler
    let mut assembler = GlyphAssembler::new();
    let program = assembler.assemble(source)?;

    // 3. Create CartridgeWriter with config
    let config = CartridgeConfig {
        name: "self_hosting".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // 4. Load display text into glyph grid
    writer.load_glyph_text(&display_text);

    // 5. Set program bytecode
    writer.set_program(&program.words);

    // 6. Apply action mapping for buttons
    let action_map: HashMap<&str, (&str, &str)> = [
        ("Edit", ("JUMP", "editor_mode")),
        ("Assemble", ("JUMP", "assemble")),
        ("Run", ("JUMP", "run_program")),
        ("Quit", ("EXIT", "")),
    ]
    .iter()
    .cloned()
    .collect();

    writer.apply_action_mapping(&action_map, &program.labels);

    // 7. Generate PNG
    let png_bytes = writer.to_png()?;

    // 8. Write to file
    let mut file = File::create(output_path.as_ref())
        .map_err(|e| format!("Failed to create output file: {}", e))?;
    file.write_all(&png_bytes)
        .map_err(|e| format!("Failed to write PNG data: {}", e))?;

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::tempdir;

    #[test]
    fn test_generate_self_hosting_cartridge() {
        // Create a temporary directory for output
        let temp_dir = tempdir().expect("Failed to create temp directory");
        let output_path = temp_dir.path().join("test_cartridge.rts.png");

        // Simple assembly program
        let source = r#"
            LDI r0, 42
            LDI r1, 100
            STORE [r1], r0
            HALT
        "#;

        // Generate cartridge
        let result = generate_self_hosting_cartridge(source, &output_path);
        assert!(result.is_ok(), "Cartridge generation failed: {:?}", result);

        // Verify file was created
        assert!(output_path.exists(), "Output file was not created");

        // Verify PNG dimensions by reading and decoding
        let png_data = std::fs::read(&output_path).expect("Failed to read generated PNG");
        let decoder = png::Decoder::new(std::io::Cursor::new(&png_data));
        let reader = decoder.read_info().expect("Failed to decode PNG");
        let info = reader.info();

        // Expected dimensions: 80x1576 (5 segments vertically stacked)
        assert_eq!(info.width, 80, "PNG width should be 80");
        assert_eq!(info.height, 1576, "PNG height should be 1576");
    }

    #[test]
    fn test_generate_cartridge_with_labels() {
        let temp_dir = tempdir().expect("Failed to create temp directory");
        let output_path = temp_dir.path().join("labeled_cartridge.rts.png");

        // Assembly with labels (self-replicating pattern)
        let source = r#"
            LDI r0, 0
            LDI r1, 100
            LDI r2, 0
            LDI r3, 1
            LDI r4, 18
        loop:
            LOAD r5, [r0]
            STORE [r1], r5
            ADD r0, r3, r0
            ADD r1, r3, r1
            ADD r2, r3, r2
            BNE r2, r4, loop
            HALT
        "#;

        let result = generate_self_hosting_cartridge(source, &output_path);
        assert!(
            result.is_ok(),
            "Cartridge generation with labels failed: {:?}",
            result
        );
        assert!(output_path.exists(), "Output file was not created");

        // Verify dimensions
        let png_data = std::fs::read(&output_path).expect("Failed to read generated PNG");
        let decoder = png::Decoder::new(std::io::Cursor::new(&png_data));
        let reader = decoder.read_info().expect("Failed to decode PNG");
        let info = reader.info();

        assert_eq!(info.width, 80, "PNG width should be 80");
        assert_eq!(info.height, 1576, "PNG height should be 1576");
    }

    #[test]
    fn test_generate_empty_cartridge() {
        let temp_dir = tempdir().expect("Failed to create temp directory");
        let output_path = temp_dir.path().join("empty_cartridge.rts.png");

        // Empty source - should still generate a valid cartridge
        let source = "";

        let result = generate_self_hosting_cartridge(source, &output_path);
        assert!(
            result.is_ok(),
            "Empty cartridge generation failed: {:?}",
            result
        );
        assert!(output_path.exists(), "Output file was not created");

        // Verify dimensions
        let png_data = std::fs::read(&output_path).expect("Failed to read generated PNG");
        let decoder = png::Decoder::new(std::io::Cursor::new(&png_data));
        let reader = decoder.read_info().expect("Failed to decode PNG");
        let info = reader.info();

        assert_eq!(info.width, 80, "PNG width should be 80");
        assert_eq!(info.height, 1576, "PNG height should be 1576");
    }
}
