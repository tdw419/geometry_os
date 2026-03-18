//! Geos-Boot Binary Entry Point
//!
//! Usage: geos-boot [program.glyph]
//!
//! If no program is specified, runs a built-in test program.

use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    let program = if args.len() > 1 {
        geos_boot::GlyphProgram::from_file(&args[1])
            .unwrap_or_else(|e| panic!("Failed to load {}: {}", args[1], e))
    } else {
        log::info!("No program specified, using test program (LDI r0, 42; HALT)");
        geos_boot::GlyphProgram::test_program()
    };

    geos_boot::run(Some(program));
}
