//! Compiler Parity Tests
//!
//! Verify that Rust compiler produces functionally correct cartridges.

use infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge;
use infinite_map_rs::ascii_cartridge::AsciiCartridge;
use std::path::PathBuf;

fn temp_dir() -> PathBuf {
    std::env::temp_dir().join("geos-parity-test")
}

#[test]
fn test_rust_compiler_standalone() {
    // Test that Rust compiler works independently
    let source = r#"
// Simple test program
:main
    LDI r0, 42
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("standalone.rts.png");

    compile_glyph_to_cartridge(source, &output).expect("Compile failed");

    // Verify output exists
    assert!(output.exists(), "Output file should exist");

    // Verify PNG can be loaded as an image with correct dimensions
    let img = image::open(&output).expect("Should load as image");
    assert_eq!(img.width(), 80, "Width should be 80");
    assert_eq!(img.height(), 1576, "Height should be 1576");

    // Load and verify via AsciiCartridge
    let cartridge = AsciiCartridge::load(&output).expect("Load failed");

    // Should have program with at least 2 words (LDI + HALT)
    // LDI is 2-word instruction (opcode + immediate)
    assert!(cartridge.program_buffer.len() >= 3, "Should have program bytecode");

    // Cleanup
    std::fs::remove_dir_all(&temp).ok();
}

#[test]
fn test_fibonacci_compilation() {
    // Note: Use // for comments, not ; (semicolon is instruction separator)
    let source = r#"
// Fibonacci sequence
    LDI r0, 0       // fib(n-2)
    LDI r1, 1       // fib(n-1)
    LDI r2, 10      // counter
    LDI r4, 1       // decrement value
:loop
    ADD r3, r0, r1  // r3 = fib(n-2) + fib(n-1)
    MOV r0, r1      // shift
    MOV r1, r3
    SUB r2, r2, r4  // counter--
    BNE r2, r0, :loop
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("fib.rts.png");

    compile_glyph_to_cartridge(source, &output).expect("Fibonacci compile failed");

    let cartridge = AsciiCartridge::load(&output).expect("Load failed");
    assert!(!cartridge.program_buffer.is_empty(), "Should have program");

    std::fs::remove_dir_all(&temp).ok();
}

#[test]
fn test_legacy_opcodes_compile() {
    // Test that legacy Python opcodes work
    let source = r#"
:main
    LDI r0, 100
    JUMP :end
    LDI r0, 200
:end
    EXIT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("legacy.rts.png");

    compile_glyph_to_cartridge(source, &output).expect("Legacy opcode compile failed");

    let cartridge = AsciiCartridge::load(&output).expect("Load failed");

    // Should compile successfully with JUMP aliasing to JMP and EXIT aliasing to HALT
    assert!(!cartridge.program_buffer.is_empty(), "Should have program");

    std::fs::remove_dir_all(&temp).ok();
}

#[test]
fn test_cartridge_dimensions() {
    let source = r#"
:main
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("dims.rts.png");

    compile_glyph_to_cartridge(source, &output).expect("Compile failed");

    // Load PNG and verify dimensions
    let img = image::open(&output).expect("Should load as image");

    // Width: 80 pixels
    // Height: 24 (glyph) + 256 (sit) + 1024 (state) + 16 (bootstrap) + 256 (program) = 1576
    assert_eq!(img.width(), 80, "Width should be 80");
    assert_eq!(img.height(), 1576, "Height should be 1576");

    std::fs::remove_dir_all(&temp).ok();
}
