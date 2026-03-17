//! Run Glyph Program on CPU Emulator
//!
//! Uses SyntheticVram to execute glyph programs without GPU.
//! Usage: cargo run --release --bin run_glyph_cpu -- <program.rts.png>

use anyhow::Result;
use image::GenericImageView;
use infinite_map_rs::synthetic_vram::{SyntheticVmConfig, SyntheticVram};
use std::path::Path;

/// Convert (x, y) coordinates to Hilbert distance
fn hilbert_xy2d(n: u32, mut x: u32, mut y: u32) -> u32 {
    let mut d = 0u32;
    let mut s = n / 2;
    while s > 0 {
        let rx = if (x & s) > 0 { 1u32 } else { 0u32 };
        let ry = if (y & s) > 0 { 1u32 } else { 0u32 };
        d += s * s * ((3 * rx) ^ ry);
        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }
        s /= 2;
    }
    d
}

fn main() -> Result<()> {
    let args: std::env::Args = std::env::args();
    let program_path = args
        .skip(1)
        .next()
        .ok_or_else(|| anyhow::anyhow!("Usage: run_glyph_cpu <program.rts.png>"))?;

    println!("Loading program from {}...", program_path);

    let path = Path::new(&program_path);

    // Load the PNG
    let img = image::open(path)?;
    let (width, height) = img.dimensions();
    println!("Image size: {}x{}", width, height);

    let rgba = img.to_rgba8();

    // Create synthetic VRAM with size matching the image
    // Image must be power of 2 (e.g., 64, 128, 256, 512, 1024, 2048, 4096)
    let grid_size = width; // Use actual image dimension
    let mut vram = if grid_size <= 1024 {
        SyntheticVram::new_small(grid_size)
    } else {
        SyntheticVram::new()
    };

    // Copy pixels into VRAM using Hilbert curve addressing
    // The PNG stores pixels at Hilbert(x,y) in row-major order
    // We need to convert each (x,y) back to Hilbert address
    for y in 0..height {
        for x in 0..width {
            let pixel = rgba.get_pixel(x, y);
            let val = pixel[0] as u32
                | ((pixel[1] as u32) << 8)
                | ((pixel[2] as u32) << 16)
                | ((pixel[3] as u32) << 24);

            // Convert (x,y) to Hilbert address
            let hilbert_addr = hilbert_xy2d(grid_size, x, y);
            vram.poke(hilbert_addr, val);
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
        println!(
            "  [{}] opcode={} stratum={} p1={} p2={} (raw={:08x})",
            i, opcode, stratum, p1, p2, val
        );
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
    let mut debug_cycles = 0;

    while total_cycles < max_cycles {
        // Print detailed execution for first 50 cycles
        if debug_cycles < 100 {
            if let Some(vm) = vram.vm_state(0) {
                let pc = vm.pc;
                let instr = vram.peek(pc);
                let opcode = instr & 0xFF;
                let stratum = (instr >> 8) & 0xFF;
                let p1 = (instr >> 16) & 0xFF;
                let p2 = (instr >> 24) & 0xFF;

                // Show more registers for debugging BRANCH issues
                let r0 = vm.regs[0];
                let r14 = vm.regs[14];
                let r15 = vm.regs[15];
                let r13 = vm.regs[13];
                println!(
                    "  [{}] PC={} op={} st={} p1={} p2={} | r0={} r10={} r13={} r14={} r15={}",
                    debug_cycles, pc, opcode, stratum, p1, p2, r0, vm.regs[10], r13, r14, r15
                );
            }
        }

        let prev_cycles = total_cycles;
        if !vram.step(0) {
            println!("\nVM stopped at cycle {}", total_cycles);
            break;
        }
        debug_cycles += 1;

        if let Some(vm) = vram.vm_state(0) {
            total_cycles = vm.cycles;

            // Check if halted
            if vm.state == 2 {
                // VM_STATE_HALTED
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
        println!(
            "  PC={} opcode={} stratum={} p1={} p2={}",
            entry.pc, entry.opcode, entry.stratum, entry.p1, entry.p2
        );
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
