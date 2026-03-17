//! Build Alpine Substrate - Combines RISC-V emulator with Alpine kernel
//!
//! Usage: cargo run --bin build_alpine_substrate

use anyhow::Result;
use image::{ImageBuffer, Rgba};
use std::path::Path;

use infinite_map_rs::glyph_stratum::glyph_compiler::{compile_glyph_file, CompiledGlyph};

// Hilbert curve: convert distance d to (x, y) coordinates
fn hilbert_d2xy(n: u32, mut d: u32) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;

    while s < n {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);

        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }

    (x, y)
}

fn load_alpine_kernel(path: &Path) -> Result<Vec<u32>> {
    let img = image::open(path)?.to_rgba8();
    let (width, height) = img.dimensions();

    println!("  Alpine kernel: {}x{} pixels", width, height);

    let mut data = Vec::with_capacity((width * height) as usize);
    for pixel in img.pixels() {
        let r = pixel[0] as u32;
        let g = pixel[1] as u32;
        let b = pixel[2] as u32;
        let a = pixel[3] as u32;
        data.push(r | (g << 8) | (b << 16) | (a << 24));
    }

    Ok(data)
}

fn create_combined_substrate(
    compiled: &CompiledGlyph,
    guest_data: &[u32],
    size: u32,
) -> ImageBuffer<Rgba<u8>, Vec<u8>> {
    let mut buffer = ImageBuffer::from_pixel(size, size, Rgba([0u8; 4]));

    // Write emulator instructions using Hilbert addressing
    for (i, chunk) in compiled.texture_data.chunks(4).enumerate() {
        let (x, y) = hilbert_d2xy(size, i as u32);
        let pixel = buffer.get_pixel_mut(x, y);
        pixel[0] = chunk[0]; // opcode
        pixel[1] = chunk[1]; // stratum
        pixel[2] = chunk[2]; // p1
        pixel[3] = chunk[3]; // p2
    }

    // Write guest data at address 0x18000 (98304)
    let guest_start = 0x18000u32;
    for (i, &val) in guest_data.iter().enumerate() {
        let addr = guest_start + i as u32;
        if addr >= size * size {
            break;
        }
        let (x, y) = hilbert_d2xy(size, addr);
        let pixel = buffer.get_pixel_mut(x, y);
        pixel[0] = (val & 0xFF) as u8;
        pixel[1] = ((val >> 8) & 0xFF) as u8;
        pixel[2] = ((val >> 16) & 0xFF) as u8;
        pixel[3] = ((val >> 24) & 0xFF) as u8;
    }

    buffer
}

fn main() -> Result<()> {
    println!("============================================================");
    println!("Geometry OS - Alpine Substrate Builder (Rust)");
    println!("============================================================");

    // Paths - relative to workspace root (geometry_os/geometry_os)
    let workspace_root = Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent().unwrap()  // systems
        .parent().unwrap(); // geometry_os (geometry_os/geometry_os)

    let glyph_path = workspace_root.join("systems/glyph_stratum/programs/riscv_mini.glyph");
    let alpine_path = workspace_root.join("alpine.rts.png");
    let output_path = workspace_root.join("alpine_emulated.rts.png");

    println!("\nGlyph emulator: {:?}", glyph_path);
    println!("Alpine kernel: {:?}", alpine_path);
    println!("Output: {:?}", output_path);

    // Compile glyph program
    println!("\n[1/3] Compiling RISC-V emulator...");
    let compiled = compile_glyph_file(glyph_path.to_str().unwrap())
        .map_err(|e| anyhow::anyhow!("Failed to compile glyph: {}", e))?;
    println!("  Compiled {} instructions", compiled.instruction_count);
    println!("  Entry point: {}", compiled.entry_point);

    // Load Alpine kernel
    println!("\n[2/3] Loading Alpine kernel...");
    let guest_data = load_alpine_kernel(&alpine_path)?;
    println!("  Loaded {} words of guest memory", guest_data.len());

    // Create combined substrate
    println!("\n[3/3] Creating combined substrate (4096x4096)...");
    let substrate = create_combined_substrate(&compiled, &guest_data, 4096);
    substrate.save(&output_path)?;
    println!("  Saved to {:?}", output_path);

    // Memory layout summary
    println!("\nMemory Layout:");
    println!("  0x00000: Emulator code ({} instructions)", compiled.instruction_count);
    println!("  0x14000: Guest PC");
    println!("  0x14100: Guest registers");
    println!("  0x18000: Guest RAM (Alpine kernel)");

    println!("\nDone! Run with:");
    println!("  cargo run --release --bin glyph_vm_boot -- alpine_emulated.rts.png");

    Ok(())
}
