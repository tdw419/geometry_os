//! Tests for CartridgeWriter module
//!
//! Verifies GPU-native cartridge generation with correct dimensions
//! and valid PNG output.

use infinite_map_rs::cartridge_writer::{
    CartridgeConfig, CartridgeWriter, BOOTSTRAP_HEIGHT, GLYPH_GRID_HEIGHT, PROGRAM_HEIGHT,
    SIT_HEIGHT, SIT_Y, STATE_BUFFER_HEIGHT, TOTAL_HEIGHT, WIDTH,
};
use std::collections::HashMap;

/// Test that cartridge dimensions are correct (80x1576)
#[test]
fn test_cartridge_dimensions() {
    let config = CartridgeConfig {
        name: String::from("test"),
        version: 1,
    };
    let writer = CartridgeWriter::new(config);

    // Verify dimensions match specification
    assert_eq!(writer.width(), WIDTH, "Width should be 80 pixels");
    assert_eq!(writer.height(), TOTAL_HEIGHT, "Height should be 1576 pixels");

    // Verify segment heights sum to total
    let expected_total =
        GLYPH_GRID_HEIGHT + SIT_HEIGHT + STATE_BUFFER_HEIGHT + BOOTSTRAP_HEIGHT + PROGRAM_HEIGHT;
    assert_eq!(
        TOTAL_HEIGHT, expected_total,
        "Segment heights should sum to total height"
    );

    // Verify individual segment heights
    assert_eq!(GLYPH_GRID_HEIGHT, 24, "Glyph grid should be 24 pixels tall");
    assert_eq!(SIT_HEIGHT, 256, "SIT should be 256 pixels tall");
    assert_eq!(
        STATE_BUFFER_HEIGHT, 1024,
        "State buffer should be 1024 pixels tall"
    );
    assert_eq!(BOOTSTRAP_HEIGHT, 16, "Bootstrap should be 16 pixels tall");
    assert_eq!(PROGRAM_HEIGHT, 256, "Program should be 256 pixels tall");
}

/// Test that an empty cartridge produces valid PNG bytes
#[test]
fn test_empty_cartridge() {
    let config = CartridgeConfig {
        name: String::from("empty_test"),
        version: 1,
    };
    let writer = CartridgeWriter::new(config);

    // Generate PNG
    let png_bytes = writer.to_png().expect("Should generate valid PNG");

    // Verify PNG is not empty
    assert!(!png_bytes.is_empty(), "PNG output should not be empty");

    // Verify PNG header signature (first 8 bytes)
    // PNG signature: 89 50 4E 47 0D 0A 1A 0A
    let signature: [u8; 8] = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
    assert_eq!(
        &png_bytes[0..8],
        signature,
        "PNG should have valid header signature"
    );

    // Verify minimum size (header + IHDR + some data)
    // A valid PNG should be at least a few hundred bytes even for small images
    assert!(
        png_bytes.len() > 100,
        "PNG should have reasonable minimum size"
    );
}

/// Test that glyph text loading works correctly
#[test]
fn test_load_glyph_text() {
    let config = CartridgeConfig::default();
    let mut writer = CartridgeWriter::new(config);

    let text = "Hello, World!\nLine 2\nLine 3";
    writer.load_glyph_text(text);

    // Verify dimensions are still correct after loading
    assert_eq!(writer.width(), WIDTH);
    assert_eq!(writer.height(), TOTAL_HEIGHT);

    // Verify PNG generation still works
    let png_bytes = writer.to_png().expect("Should generate valid PNG");
    assert!(!png_bytes.is_empty(), "PNG should not be empty");
}

/// Test that SIT entries can be set
#[test]
fn test_set_sit() {
    let config = CartridgeConfig::default();
    let mut writer = CartridgeWriter::new(config);

    // Set a few SIT entries
    writer.set_sit(0, 0x01, 0x1234);
    writer.set_sit(100, 0xFF, 0xABCD);
    writer.set_sit(255, 0x80, 0x0000);

    // Verify PNG generation works
    let png_bytes = writer.to_png().expect("Should generate valid PNG");
    assert!(!png_bytes.is_empty(), "PNG should not be empty");
}

/// Test that program bytecode can be set
#[test]
fn test_set_program() {
    let config = CartridgeConfig::default();
    let mut writer = CartridgeWriter::new(config);

    // Set some program words
    let program = vec![0x12345678, 0xDEADBEEF, 0x00000000, 0xFFFFFFFF];
    writer.set_program(&program);

    // Verify PNG generation works
    let png_bytes = writer.to_png().expect("Should generate valid PNG");
    assert!(!png_bytes.is_empty(), "PNG should not be empty");
}

/// Test that individual glyphs can be set
#[test]
fn test_set_glyph() {
    let config = CartridgeConfig::default();
    let mut writer = CartridgeWriter::new(config);

    // Set some glyphs
    writer.set_glyph(0, 0, 'H');
    writer.set_glyph(1, 0, 'i');
    writer.set_glyph(79, 23, '!'); // Bottom-right corner

    // Verify PNG generation works
    let png_bytes = writer.to_png().expect("Should generate valid PNG");
    assert!(!png_bytes.is_empty(), "PNG should not be empty");
}

/// Test pixel buffer size is correct
#[test]
fn test_pixel_buffer_size() {
    let config = CartridgeConfig::default();
    let writer = CartridgeWriter::new(config);

    // RGBA = 4 bytes per pixel
    let expected_size = WIDTH * TOTAL_HEIGHT * 4;
    assert_eq!(
        writer.pixels().len(),
        expected_size,
        "Pixel buffer should have exactly width * height * 4 bytes"
    );
}

/// Test SIT pattern detection for [X] button patterns
#[test]
fn test_sit_pattern_detection() {
    let mut writer = CartridgeWriter::new(CartridgeConfig::default());

    // Load text with [R] and [Q] button patterns
    let text = "[R] Run  [Q] Quit\nSecond line";
    writer.load_glyph_text(text);

    let patterns = writer.detect_patterns();

    assert!(patterns.len() >= 2, "Should detect [R] and [Q] patterns, got {} patterns", patterns.len());

    // Verify pattern labels
    let labels: Vec<char> = patterns.iter().map(|p| p.label).collect();
    assert!(labels.contains(&'R'), "Should find [R] pattern");
    assert!(labels.contains(&'Q'), "Should find [Q] pattern");

    // Verify actions are captured
    let actions: Vec<&str> = patterns.iter().map(|p| p.action.as_str()).collect();
    assert!(actions.contains(&"Run"), "Should capture 'Run' action");
    assert!(actions.contains(&"Quit"), "Should capture 'Quit' action");
}

/// Test apply_action_mapping with labels and action map
#[test]
fn test_apply_action_mapping() {
    let mut writer = CartridgeWriter::new(CartridgeConfig::default());

    let text = "[R] Run\n";
    writer.load_glyph_text(text);

    // Create labels and action map
    let mut labels = HashMap::new();
    labels.insert("main".to_string(), 0x8000);

    let mut action_map: HashMap<&str, (&str, &str)> = HashMap::new();
    action_map.insert("Run", ("JUMP", "main"));

    writer.apply_action_mapping(&action_map, &labels);

    // Verify SIT entry was set at the pattern position (x=0, y=0)
    // SIT index = y * WIDTH + x = 0 * 80 + 0 = 0
    // The SIT entry at index 0 should have:
    // - R channel: opcode 9 (JUMP)
    // - G channel: 0x00 (low byte of 0x8000)
    // - B channel: 0x80 (high byte of 0x8000)
    let pixels = writer.pixels();
    let sit_y = SIT_Y; // SIT segment starts at y=24
    let sit_offset = (sit_y * WIDTH + 0) * 4; // First pixel of first SIT row

    assert_eq!(pixels[sit_offset], 9, "SIT opcode should be JUMP (9)");
    assert_eq!(pixels[sit_offset + 1], 0x00, "Target address low byte");
    assert_eq!(pixels[sit_offset + 2], 0x80, "Target address high byte");
    assert_eq!(pixels[sit_offset + 3], 255, "Alpha should be 255");
}

/// Test pattern detection with multiple patterns on same line
#[test]
fn test_multiple_patterns_same_line() {
    let mut writer = CartridgeWriter::new(CartridgeConfig::default());

    let text = "[A] Add  [S] Sub  [M] Mul  [D] Div";
    writer.load_glyph_text(text);

    let patterns = writer.detect_patterns();

    assert_eq!(patterns.len(), 4, "Should detect all 4 patterns");

    // Verify all labels are found
    let labels: String = patterns.iter().map(|p| p.label).collect();
    assert!(labels.contains('A'), "Should find A");
    assert!(labels.contains('S'), "Should find S");
    assert!(labels.contains('M'), "Should find M");
    assert!(labels.contains('D'), "Should find D");
}

/// Test pattern detection with numeric labels
#[test]
fn test_numeric_pattern_labels() {
    let mut writer = CartridgeWriter::new(CartridgeConfig::default());

    let text = "[1] Start  [2] Stop  [0] Exit";
    writer.load_glyph_text(text);

    let patterns = writer.detect_patterns();

    assert_eq!(patterns.len(), 3, "Should detect 3 numeric patterns");

    let labels: String = patterns.iter().map(|p| p.label).collect();
    assert!(labels.contains('0'), "Should find 0");
    assert!(labels.contains('1'), "Should find 1");
    assert!(labels.contains('2'), "Should find 2");
}
