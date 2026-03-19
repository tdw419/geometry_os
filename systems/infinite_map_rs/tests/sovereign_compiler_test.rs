//! Integration tests for the Sovereign Compiler cartridge generator
//!
//! These tests verify that the sovereign compiler cartridge can be generated
//! and contains the correct structure for GPU-native compilation.

use infinite_map_rs::ascii_native::sovereign_compiler::generate_sovereign_cartridge;
use tempfile::tempdir;

#[test]
fn test_sovereign_cartridge_generates() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("sovereign_compiler.rts.png");

    let source = "LDI r0, 42\nHALT";
    let result = generate_sovereign_cartridge(source, &output_path);

    assert!(result.is_ok(), "Generation failed: {:?}", result);
    assert!(output_path.exists(), "Output file not created");
}

#[test]
fn test_sovereign_cartridge_with_complex_source() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("complex_compiler.rts.png");

    // More complex source with labels
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

    let result = generate_sovereign_cartridge(source, &output_path);

    assert!(result.is_ok(), "Complex generation failed: {:?}", result);
    assert!(output_path.exists(), "Output file not created");
}

#[test]
fn test_sovereign_cartridge_png_dimensions() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("dimension_test.rts.png");

    let source = "LDI r0, 42\nHALT";
    let result = generate_sovereign_cartridge(source, &output_path);

    assert!(result.is_ok(), "Generation failed: {:?}", result);

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
fn test_sovereign_cartridge_empty_source() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("empty_compiler.rts.png");

    // Empty source - should still generate a valid cartridge
    let source = "";

    let result = generate_sovereign_cartridge(source, &output_path);

    assert!(result.is_ok(), "Empty source generation failed: {:?}", result);
    assert!(output_path.exists(), "Output file not created");
}
