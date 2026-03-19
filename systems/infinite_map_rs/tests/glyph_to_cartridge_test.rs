use infinite_map_rs::ascii_cartridge::AsciiCartridge;
use infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge;
use std::path::PathBuf;
use std::sync::atomic::{AtomicU64, Ordering};

static TEST_COUNTER: AtomicU64 = AtomicU64::new(0);

fn temp_dir() -> PathBuf {
    // Use unique directory per test to avoid race conditions
    let id = TEST_COUNTER.fetch_add(1, Ordering::SeqCst);
    std::env::temp_dir().join(format!("geos-glyph-test-{}", id))
}

#[test]
fn test_simple_program() {
    let glyph_source = r#"
:main
    LDI r0, 42
    LDI r1, 0xF000
    STORE [r1], r0
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("simple_test.rts.png");

    let result = compile_glyph_to_cartridge(glyph_source, &output);
    assert!(result.is_ok(), "Compilation should succeed: {:?}", result);
    assert!(output.exists(), "Output file should exist");

    // Load and verify PNG
    let img = image::open(&output).expect("Should load PNG");
    assert_eq!(img.width(), 80);
    assert_eq!(img.height(), 1576);

    // Cleanup
    std::fs::remove_dir_all(&temp).ok();
}

#[test]
fn test_fibonacci_program() {
    let glyph_source = r#"
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
    let output = temp.join("fib_test.rts.png");

    let result = compile_glyph_to_cartridge(glyph_source, &output);
    assert!(
        result.is_ok(),
        "Fibonacci compilation should succeed: {:?}",
        result
    );

    std::fs::remove_dir_all(&temp).ok();
}

#[test]
fn test_output_loads_as_cartridge() {
    let glyph_source = r#"
:main
    LDI r0, 42
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("loadable.rts.png");

    compile_glyph_to_cartridge(glyph_source, &output).expect("Compile failed");

    // Load via AsciiCartridge
    let cartridge = AsciiCartridge::load(&output).expect("Should load as cartridge");

    // Should have program with at least 3 words (LDI + imm + HALT)
    assert!(
        !cartridge.program_buffer.is_empty(),
        "Should have program bytecode"
    );

    std::fs::remove_dir_all(&temp).ok();
}
