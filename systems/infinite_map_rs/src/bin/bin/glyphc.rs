//! Glyph Compiler CLI
//!
//! Compiles .glyph assembly files to .rts.png texture format.
//!
//! Usage:
//!   cargo run --release --bin glyphc -- input.glyph output.rts.png

use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 3 {
        eprintln!("Usage: {} <input.glyph> <output.rts.png>", args[0]);
        eprintln!();
        eprintln!("Compiles .glyph assembly to .rts.png texture format");
        eprintln!("for direct execution by the Glyph VM Scheduler.");
        std::process::exit(1);
    }

    let input_path = &args[1];
    let output_path = &args[2];

    println!("═══════════════════════════════════════════════════════════");
    println!("        GEOMETRY OS - Glyph to Texture Compiler");
    println!("═══════════════════════════════════════════════════════════");
    println!();
    println!("  Input:  {}", input_path);
    println!("  Output: {}", output_path);
    println!();

    match glyph_stratum::glyph_to_rts::compile_glyph_file(input_path, output_path) {
        Ok(()) => {
            println!("  ✓ Compilation successful");
            println!();
            println!("To boot:");
            println!("  cargo run --release --bin visual_kernel -- --ubuntu {}", output_path);
        }
        Err(e) => {
            eprintln!("  ✗ Compilation failed: {}", e);
            std::process::exit(1);
        }
    }
}
