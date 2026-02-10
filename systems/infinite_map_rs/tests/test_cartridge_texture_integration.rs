//! Integration tests for cartridge texture loading (Phase 35.9.1)
//!
//! These tests verify that real .rts.png files can be loaded
//! and used for Evolution Zone rendering.

use std::path::PathBuf;

/// Test loading a real .rts.png cartridge texture.
///
/// This test requires a WGPU device and should be run with:
/// cargo test --package infinite_map_rs test_load_real_cartridge_texture -- --ignored
#[test]
#[ignore] // Requires WGPU device
fn test_load_real_cartridge_texture() {
    // This test requires a full WGPU setup with device, queue, bind group layout
    // Run with: cargo test --package infinite_map_rs test_load_real_cartridge_texture -- --ignored

    let fixture_path = PathBuf::from("tests/fixtures/test_cartridge.rts.png");
    assert!(fixture_path.exists(), "Test fixture not found. Run create_test_cartridge.py");

    // Actual test would require device initialization
    // For now, we verify the file exists and is readable
    let metadata = std::fs::metadata(&fixture_path);
    assert!(metadata.is_ok(), "Cannot read fixture file");
    let file_size = metadata.unwrap().len();
    assert!(file_size > 0, "Fixture file is empty");
}

/// Test that the test cartridge fixture exists and is valid.
///
/// This test runs in CI without requiring a GPU device.
#[test]
fn test_cartridge_fixture_exists() {
    let fixture_path = PathBuf::from("tests/fixtures/test_cartridge.rts.png");
    assert!(
        fixture_path.exists(),
        "Test fixture not found. Run: python3 systems/infinite_map_rs/tests/fixtures/create_test_cartridge.py"
    );

    // Verify file is readable
    let metadata = std::fs::metadata(&fixture_path).expect("Cannot read fixture file");
    assert!(metadata.len() > 0, "Fixture file is empty");

    // Verify it's a valid PNG by checking the header
    let mut file = std::fs::File::open(&fixture_path).expect("Cannot open fixture file");
    let mut header = [0u8; 8];
    std::io::Read::read_exact(&mut file, &mut header).expect("Cannot read file header");

    // PNG signature: 137 80 78 71 13 10 26 10
    assert_eq!(header, [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A], "File is not a valid PNG");
}

/// Test that the test cartridge metadata sidecar exists.
#[test]
fn test_cartridge_metadata_exists() {
    // The sidecar is named test_cartridge.meta.json (not test_cartridge.rts.meta.json)
    // because PixelRTSEncoder.save() strips .rts before adding .meta.json
    let meta_path = PathBuf::from("tests/fixtures/test_cartridge.meta.json");
    assert!(
        meta_path.exists(),
        "Metadata sidecar not found. Run create_test_cartridge.py"
    );

    // Verify it's valid JSON
    let contents = std::fs::read_to_string(&meta_path).expect("Cannot read metadata file");
    let _value: serde_json::Value = serde_json::from_str(&contents)
        .expect("Metadata is not valid JSON");

    // Verify required fields
    let json = serde_json::from_str::<serde_json::Value>(&contents).unwrap();
    assert!(json.get("format").is_some(), "Missing 'format' field");
    assert!(json.get("grid_size").is_some(), "Missing 'grid_size' field");
    assert!(json.get("data_size").is_some(), "Missing 'data_size' field");
}

/// Test cartridge fixture PNG dimensions using image crate.
///
/// This test verifies the fixture is a valid PNG with expected dimensions.
#[test]
fn test_cartridge_fixture_dimensions() {
    let fixture_path = PathBuf::from("tests/fixtures/test_cartridge.rts.png");
    assert!(fixture_path.exists(), "Test fixture not found");

    // Load PNG using image crate to verify dimensions
    let img = image::open(&fixture_path).expect("Failed to load fixture as PNG");
    assert_eq!(img.width(), 64, "Fixture width should be 64");
    assert_eq!(img.height(), 64, "Fixture height should be 64");
}
