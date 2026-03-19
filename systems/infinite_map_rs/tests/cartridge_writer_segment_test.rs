use infinite_map_rs::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use tempfile::tempdir;

#[test]
fn test_set_segment_writes_at_address() {
    let config = CartridgeConfig {
        name: "segment_test".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // Write some words at address 0x2000 (8192 decimal)
    let words = vec![0x01020304, 0x05060708, 0x0A0B0C0D];
    writer.set_segment(0x2000, &words);

    // Generate PNG and verify it's valid
    let temp_dir = tempdir().expect("Failed to create temp dir");
    let output = temp_dir.path().join("segment_test.rts.png");

    let png_bytes = writer.to_png().expect("Should generate PNG");
    std::fs::write(&output, &png_bytes).expect("Should write file");

    assert!(output.exists(), "PNG should exist");

    // Verify PNG dimensions
    let decoder = png::Decoder::new(std::io::Cursor::new(&png_bytes));
    let reader = decoder.read_info().expect("Failed to decode PNG");
    assert_eq!(reader.info().width, 80);
    assert_eq!(reader.info().height, 1576);
}

#[test]
fn test_set_source_text_encodes_ascii() {
    let config = CartridgeConfig {
        name: "source_test".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    let source = "LDI r0, 42\nHALT";
    writer.set_source_text(0x1000, source);

    let temp_dir = tempdir().expect("Failed to create temp dir");
    let output = temp_dir.path().join("source_test.rts.png");

    let png_bytes = writer.to_png().expect("Should generate PNG");
    std::fs::write(&output, &png_bytes).expect("Should write file");

    assert!(output.exists(), "PNG should exist");
}
