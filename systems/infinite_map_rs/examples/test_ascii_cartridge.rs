//! Test loading ASCII cartridge into Synthetic VRAM
use infinite_map_rs::ascii_cartridge::{AsciiCartridge, GLYPH_WIDTH};
use infinite_map_rs::synthetic_vram::SyntheticVram;
use std::path::Path;

fn main() {
    let cartridge_path = Path::new("../../test_dashboard.rts.png");

    if !cartridge_path.exists() {
        eprintln!("File not found: test_dashboard.rts.png");
        eprintln!("Run: python3 systems/glyph_stratum/geos_ascii_compiler.py apps/ascii-world/ascii-world-master/src/ascii/states/dashboard.ascii test_dashboard.rts.png");
        std::process::exit(1);
    }

    println!("=== ASCII Cartridge Test ===");
    println!("\nLoading cartridge...");

    // Load cartridge
    let cartridge = match AsciiCartridge::load(cartridge_path) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("✗ Failed to load cartridge: {}", e);
            std::process::exit(1);
        },
    };

    println!("✓ Cartridge loaded successfully");
    println!("  Name: {}", cartridge.bootstrap.name);
    println!("  Version: {}", cartridge.bootstrap.version);
    println!(
        "  Glyph grid: {}x{}",
        GLYPH_WIDTH, cartridge.bootstrap.pattern_count
    );
    println!("  SIT entries: {}", cartridge.sit_entries.len());
    println!("  Buttons found:");
    for entry in &cartridge.sit_entries {
        println!(
            "    - [{}] at ({}, {}) → opcode {} ({})",
            entry.target,
            entry.x,
            entry.y,
            entry.opcode,
            opcode_name(entry.opcode)
        );
    }

    // Load into Synthetic VRAM
    println!("\n=== Loading into Synthetic VRAM ===");
    let mut vram = SyntheticVram::new_small(256); // Small grid for testing
    let base_addr = 0x8000;

    match cartridge.load_into_vram(&mut vram, base_addr) {
        Ok(()) => {
            println!("✓ Cartridge loaded into VRAM at address 0x{:X}", base_addr);

            // Verify some pixels were written
            let sample_addr = base_addr;
            let val = vram.peek(sample_addr);
            println!("  Sample at 0x{:X}: 0x{:08X}", sample_addr, val);

            // Check SIT region
            let sit_base = base_addr + (GLYPH_WIDTH * 24);
            let sit_sample = vram.peek(sit_base);
            println!("  SIT region at 0x{:X}: 0x{:08X}", sit_base, sit_sample);
        },
        Err(e) => {
            eprintln!("✗ Failed to load into VRAM: {}", e);
            std::process::exit(1);
        },
    }

    println!("\n=== Test Complete ===");
}

fn opcode_name(opcode: u8) -> &'static str {
    match opcode {
        0 => "NOP",
        1 => "LDI",
        3 => "LD",
        4 => "ST",
        5 => "ADD",
        6 => "SUB",
        7 => "MUL",
        8 => "DIV",
        9 => "JMP",
        10 => "JZ",
        11 => "CALL",
        12 => "RET",
        13 => "HALT",
        209 => "JUMP",
        215 => "DRAW",
        225 => "SPATIAL_SPAWN",
        232 => "GLYPH_WRITE",
        _ => "UNKNOWN",
    }
}
