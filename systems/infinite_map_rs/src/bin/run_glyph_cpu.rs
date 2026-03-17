//! Run Glyph Program on CPU Emulator
//!
//! Uses SyntheticVram to execute glyph programs without GPU.
//! Usage: cargo run --release --bin run_glyph_cpu -- <program.rts.png>

use anyhow::Result;
use image::GenericImageView;
use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};
use std::path::Path;

fn main() -> Result<()> {
    let args: std::env::Args = std::env::args();
    let program_path = args.skip(1).next()
        .ok_or_else(|| anyhow::anyhow!("Usage: run_glyph_cpu <program.rts.png>"))?;

    println!("Loading program from {}...", program_path);

    let path = Path::new(&program_path);

    // Load the PNG
    let img = image::open(path)?;
    let (width, height) = img.dimensions();
    println!("Image size: {}x{}", width, height);

    let rgba = img.to_rgba8();
    let pixels: Vec<u32> = rgba.pixels()
        .map(|p| p[0] as u32 | ((p[1] as u32) << 8) | ((p[2] as u32) << 16) | ((p[3] as u32) << 24))
        .collect();

    // Create synthetic VRAM (use smaller grid if image is smaller)
    let grid_size = if width == 4096 { 4096 } else { 64 };
    let mut vram = SyntheticVram::new_small(grid_size);

    // Copy pixels into VRAM
    for (i, &val) in pixels.iter().enumerate() {
        if i < (grid_size * grid_size) as usize {
            vram.poke(i as u32, val);
        }
    }

    // Dump first 30 instructions for debugging
    println!("\nFirst 30 instructions (Hilbert addresses 0-29):");
    for i in 0..30 {
        let val = vram.peek(i);
        let opcode = val & 0xFF;
        let stratum = (val >> 8) & 0xFF;
        let p1 = (val >> 16) & 0xFF;
        let p2 = (val >> 24) & 0xFF;
        println!("  [{}] opcode={} stratum={} p1={} p2={} (raw={:08x})",
            i, opcode, stratum, p1, p2, val);
    }

    // Spawn VM at entry point 0
    let config = SyntheticVmConfig {
        entry_point: 0,
        ..Default::default()
    };
    vram.spawn_vm(0, &config).map_err(|e| anyhow::anyhow!(e))?;
    vram.enable_tracing();

    println!("\nRunning...");

    // Run for up to 100000 cycles
    let max_cycles = 100000;
    let mut total_cycles = 0;

    while total_cycles < max_cycles {
        let prev_cycles = total_cycles;
        if !vram.step(0) {
            println!("\nVM stopped at cycle {}", total_cycles);
            break;
        }

        if let Some(vm) = vram.vm_state(0) {
            total_cycles = vm.cycles;

            // Check if halted
            if vm.state == 2 {  // VM_STATE_HALTED
                println!("\nVM Halted after {} cycles", total_cycles);
                break;
            }

            // Progress indicator every 1000 cycles
            if total_cycles > prev_cycles && total_cycles % 1000 == 0 {
                print!("\rCycles: {} | PC: {}", total_cycles, vm.pc);
                use std::io::Write;
                std::io::stdout().flush().ok();
            }
        } else {
            break;
        }
    }

    // Print trace
    println!("\n\nExecution trace (last 50 instructions):");
    for entry in vram.trace().iter().rev().take(50).rev() {
        println!("  PC={} opcode={} stratum={} p1={} p2={}",
            entry.pc, entry.opcode, entry.stratum, entry.p1, entry.p2);
    }

    if total_cycles >= max_cycles {
        println!("\nReached max cycles ({})", max_cycles);
    }

    // Dump UART memory (0x200-0x300)
    println!("\nUART Output (memory 0x200-0x220):");
    for addr in 0x200..0x220 {
        let val = vram.peek(addr);
        if val != 0 {
            let ch = (val & 0xFF) as u8 as char;
            if ch.is_ascii_graphic() || ch == ' ' || ch == '\n' {
                print!("{}", ch);
            } else {
                print!(".");
            }
        }
    }
    println!();

    // Show final VM state
    if let Some(vm) = vram.vm_state(0) {
        println!("\nFinal VM State:");
        println!("  PC: {}", vm.pc);
        println!("  Cycles: {}", vm.cycles);
        println!("  Halted: {}", vm.state == 2);
        println!("  First 10 regs: {:?}", &vm.regs[..10]);
    }

    Ok(())
}
