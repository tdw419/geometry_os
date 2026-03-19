//! ASCII-Native Self-Hosting Integration Tests
//!
//! Verifies the complete pipeline:
//! 1. Load ASCII template
//! 2. Compile source to cartridge
//! 3. Load cartridge into AsciiCartridge
//! 4. Verify output

use infinite_map_rs::ascii_native::self_hosting_cartridge::generate_self_hosting_cartridge;
use infinite_map_rs::ascii_native::self_hosting_template::SelfHostingTemplate;
use infinite_map_rs::ascii_cartridge::AsciiCartridge;
use std::path::PathBuf;

fn temp_path(name: &str) -> PathBuf {
    std::env::temp_dir().join(name)
}

#[test]
fn test_template_loads_successfully() {
    let template = SelfHostingTemplate::load().expect("Template should load");
    assert!(!template.source().is_empty(), "Template should have content");
    assert!(template.source().contains("[A] Edit"), "Template should have Edit button");
    assert!(template.source().contains("[B] Assemble"), "Template should have Assemble button");
}

#[test]
fn test_template_renders_with_source() {
    let template = SelfHostingTemplate::load().expect("Template should load");
    let source_lines = vec!["LDI r0, 42", "HALT"];
    let rendered = template.render("Ready", &source_lines);

    assert!(rendered.contains("Ready"), "Should show status");
    assert!(rendered.contains("LDI r0, 42"), "Should show source line");
    assert!(rendered.contains("[A] Edit"), "Should have buttons");
}

#[test]
fn test_cartridge_generation_produces_valid_png() {
    let source = ":main\n    LDI r0, 42\n    HALT\n";
    let output = temp_path("test_cartridge_png.rts.png");

    generate_self_hosting_cartridge(source, &output).expect("Should generate cartridge");

    // Verify PNG is valid
    let img = image::open(&output).expect("Should load as PNG");
    assert_eq!(img.width(), 80, "Width should be 80");
    assert_eq!(img.height(), 1576, "Height should be 1576 (5 segments)");

    std::fs::remove_file(&output).ok();
}

#[test]
fn test_cartridge_loads_via_ascii_cartridge() {
    let source = ":main\n    LDI r0, 42\n    LDI r1, 0xF000\n    STORE [r1], r0\n    HALT\n";
    let output = temp_path("test_cartridge_load.rts.png");

    generate_self_hosting_cartridge(source, &output).expect("Should generate cartridge");

    // Load via AsciiCartridge
    let cartridge = AsciiCartridge::load(&output).expect("Should load as AsciiCartridge");

    // Verify program buffer has content
    assert!(!cartridge.program_buffer.is_empty(), "Should have program bytecode");

    // First instruction should be LDI (opcode 1)
    let first = cartridge.program_buffer[0];
    assert_eq!(first & 0xFF, 1, "First opcode should be LDI (1)");

    std::fs::remove_file(&output).ok();
}

#[test]
fn test_cartridge_with_labels() {
    // Simple program with labels - use 3-operand ADD format
    let source = r#"
:main
    LDI r0, 0
    LDI r1, 1
:loop
    ADD r2, r0, r1
    MOV r0, r1
    MOV r1, r2
    JMP :loop
    HALT
"#;
    let output = temp_path("test_cartridge_labels.rts.png");

    generate_self_hosting_cartridge(source, &output).expect("Should generate cartridge with labels");

    let cartridge = AsciiCartridge::load(&output).expect("Should load");
    assert!(cartridge.program_buffer.len() > 5, "Should have multiple instructions");

    std::fs::remove_file(&output).ok();
}
