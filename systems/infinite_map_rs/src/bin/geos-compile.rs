//! GEOS Glyph Compiler CLI
//!
//! Compiles .glyph files to .rts.png cartridges.
//!
//! Usage:
//!   geos-compile input.glyph -o output.rts.png
//!   geos-compile input.glyph  # outputs to input.rts.png
//!   geos-compile --self-hosting input.glyph  # ASCII-First visual template

use clap::Parser;
use std::path::PathBuf;

#[derive(Parser, Debug)]
#[command(name = "geos-compile")]
#[command(about = "Compile .glyph source to GPU cartridge", long_about = None)]
struct Args {
    /// Input .glyph file
    input: PathBuf,

    /// Output .rts.png file
    #[arg(short, long)]
    output: Option<PathBuf>,

    /// Verbose output
    #[arg(short, long)]
    verbose: bool,

    /// Use ASCII-First self-hosting template for visual interface
    #[arg(long)]
    self_hosting: bool,
}

fn main() {
    let args = Args::parse();

    let source = match std::fs::read_to_string(&args.input) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading {}: {}", args.input.display(), e);
            std::process::exit(1);
        },
    };

    let output = args
        .output
        .unwrap_or_else(|| args.input.with_extension("rts.png"));

    if args.verbose {
        eprintln!("Compiling {} -> {}", args.input.display(), output.display());
    }

    if args.self_hosting {
        // Use GPU-sovereign compiler (embeds self-hosting assembler in cartridge)
        if args.verbose {
            eprintln!("Using GPU-sovereign compiler template");
        }
        match infinite_map_rs::ascii_native::sovereign_compiler::generate_sovereign_cartridge(
            &source, &output,
        ) {
            Ok(()) => {
                if args.verbose {
                    eprintln!("Success: {}", output.display());
                }
            },
            Err(e) => {
                eprintln!("Compilation error: {}", e);
                std::process::exit(1);
            },
        }
    } else {
        // Standard compilation path
        match infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge(&source, &output) {
            Ok(()) => {
                if args.verbose {
                    eprintln!("Success: {}", output.display());
                }
            },
            Err(e) => {
                eprintln!("Compilation error: {}", e);
                std::process::exit(1);
            },
        }
    }
}
