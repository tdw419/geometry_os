//! Render Memory to Image
//!
//! Actually renders the RAM texture to a viewable image.
//! Programs become visible: each opcode maps to a color.
//! Outputs a PPM file you can open and see.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};
    use std::io::Write;

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });
        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;
        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Render Memory Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;
        Some((Arc::new(device), Arc::new(queue)))
    }

    /// Map opcode byte to RGB color
    fn opcode_color(opcode: u8) -> [u8; 3] {
        match opcode {
            0   => [30, 30, 30],       // NOP - near black
            1   => [0, 255, 255],      // LDI - cyan
            2   => [128, 128, 128],    // MOV - gray
            3   => [255, 255, 0],      // LOAD - yellow
            4   => [255, 0, 0],        // STORE - red
            5   => [0, 255, 0],        // ADD - green
            6   => [0, 200, 100],      // SUB - sea green
            7   => [255, 128, 0],      // MUL - orange
            8   => [200, 100, 0],      // DIV - brown
            9   => [128, 0, 128],      // JMP - purple
            10  => [200, 0, 200],      // BRANCH - magenta
            11  => [0, 128, 200],      // CALL - sky blue
            12  => [80, 160, 200],     // RETURN - light blue
            13  => [255, 255, 255],    // HALT - white
            14  => [160, 160, 0],      // DATA - olive
            129 => [200, 200, 0],      // OR - yellow-green
            131 => [0, 0, 200],        // SHL - blue
            _   => {
                // Data values: show as dim heat map
                let v = opcode as u32;
                let r = ((v * 7) % 60 + 15) as u8;
                let g = ((v * 13) % 40 + 10) as u8;
                let b = ((v * 3) % 50 + 20) as u8;
                [r, g, b]
            }
        }
    }

    /// Hilbert curve d→(x,y)
    fn d2xy(n: u32, d: u32) -> (u32, u32) {
        let mut x: u32 = 0;
        let mut y: u32 = 0;
        let mut s: u32 = 1;
        let mut dd = d;
        while s < n {
            let rx = 1 & (dd / 2);
            let ry = 1 & (dd ^ rx);
            if ry == 0 {
                if rx == 1 { x = s - 1 - x; y = s - 1 - y; }
                std::mem::swap(&mut x, &mut y);
            }
            x += s * rx;
            y += s * ry;
            dd /= 4;
            s *= 2;
        }
        (x, y)
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_render_sovereignty_chain() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => { println!("SKIP: No GPU"); return; }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Render RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1, sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING
                | wgpu::TextureUsages::COPY_DST
                | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        println!("\n=== RENDERING SOVEREIGNTY CHAIN ===\n");

        // --- Write the self-replication program (addr 0-17) ---
        let self_rep = vec![
            (0, glyph(1, 0, 0, 0)), (1, 0u32),
            (2, glyph(1, 0, 1, 0)), (3, 100u32),
            (4, glyph(1, 0, 2, 0)), (5, 0u32),
            (6, glyph(1, 0, 3, 0)), (7, 1u32),
            (8, glyph(1, 0, 4, 0)), (9, 18u32),
            (10, glyph(3, 0, 0, 5)),
            (11, glyph(4, 0, 1, 5)),
            (12, glyph(5, 0, 3, 0)),
            (13, glyph(5, 0, 3, 1)),
            (14, glyph(5, 0, 3, 2)),
            (15, glyph(10, 1, 2, 4)),
            (16, (-7i32) as u32),
            (17, glyph(13, 0, 0, 0)),
        ];
        for &(addr, val) in &self_rep {
            scheduler.poke_substrate_single(addr, val);
        }

        // Execute to create the replica at addr 100
        let config = VmConfig {
            entry_point: 0, parent_id: 0xFF,
            base_addr: 0, bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("spawn");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Read back the memory and render it
        // Render a 128x128 region showing the first 16384 Hilbert addresses
        let img_size: u32 = 128;
        let pixel_count = img_size * img_size;
        let mut pixels = vec![[0u8; 3]; pixel_count as usize];

        // Map Hilbert addresses to (x,y) in a 128x128 image
        for hilbert_addr in 0..pixel_count {
            let val = scheduler.peek_substrate_single(hilbert_addr);
            let opcode = (val & 0xFF) as u8;
            let color = opcode_color(opcode);

            // Map Hilbert address to 2D position within 128x128
            let (hx, hy) = d2xy(img_size, hilbert_addr);
            if hx < img_size && hy < img_size {
                pixels[(hy * img_size + hx) as usize] = color;
            }
        }

        // Write PPM file
        let output_path = "target/sovereignty_chain.ppm";
        let mut file = std::fs::File::create(output_path).expect("create PPM");
        write!(file, "P6\n{} {}\n255\n", img_size, img_size).expect("write header");
        for px in &pixels {
            file.write_all(px).expect("write pixel");
        }
        println!("  Wrote {} ({}x{} pixels)", output_path, img_size, img_size);

        // Also render a "zoomed" view of just the program area
        let zoom_size: u32 = 32;
        let mut zoomed = vec![[0u8; 3]; (zoom_size * zoom_size) as usize];

        // First 256 addresses mapped to 16x16, then scaled 2x
        for addr in 0u32..256 {
            let val = scheduler.peek_substrate_single(addr);
            let opcode = (val & 0xFF) as u8;
            let color = opcode_color(opcode);
            let (hx, hy) = d2xy(16, addr);
            // Scale 2x
            for dy in 0..2u32 {
                for dx in 0..2u32 {
                    let px = hx * 2 + dx;
                    let py = hy * 2 + dy;
                    if px < zoom_size && py < zoom_size {
                        zoomed[(py * zoom_size + px) as usize] = color;
                    }
                }
            }
        }

        let zoom_path = "target/sovereignty_zoomed.ppm";
        let mut file = std::fs::File::create(zoom_path).expect("create PPM");
        write!(file, "P6\n{} {}\n255\n", zoom_size, zoom_size).expect("write header");
        for px in &zoomed {
            file.write_all(px).expect("write pixel");
        }
        println!("  Wrote {} ({}x{} pixels, 2x zoom of first 256 addrs)", zoom_path, zoom_size, zoom_size);

        // Print the text-art version of what the image shows
        println!("\n  Program at addr 0-17 (original):");
        for &(addr, val) in &self_rep {
            let op = (val & 0xFF) as u8;
            let name = match op {
                1 => "LDI     ", 3 => "LOAD    ", 4 => "STORE   ",
                5 => "ADD     ", 10 => "BRANCH  ", 13 => "HALT    ",
                _ => "data    ",
            };
            let [r, g, b] = opcode_color(op);
            // Use ANSI colors in terminal
            print!("  \x1b[38;2;{};{};{}m██\x1b[0m", r, g, b);
            println!(" [{:3}] 0x{:08X}  {}", addr, val, name);
        }

        // Check replica
        println!("\n  Replica at addr 100-117:");
        let mut replica_ok = true;
        for &(orig_addr, expected_val) in &self_rep {
            let replica_addr = 100 + orig_addr;
            let actual = scheduler.peek_substrate_single(replica_addr);
            let mark = if actual == expected_val { "✓" } else { "✗" };
            if actual != expected_val { replica_ok = false; }
            let op = (actual & 0xFF) as u8;
            let [r, g, b] = opcode_color(op);
            print!("  \x1b[38;2;{};{};{}m██\x1b[0m", r, g, b);
            println!(" [{:3}] {} 0x{:08X}", replica_addr, mark, actual);
        }

        println!();
        if replica_ok {
            println!("  ╔════════════════════════════════════════════════════════════╗");
            println!("  ║  VISUAL SOVEREIGNTY ACHIEVED.                             ║");
            println!("  ║                                                            ║");
            println!("  ║  Programs are visible as colored pixels:                   ║");
            println!("  ║    \x1b[38;2;0;255;255m██\x1b[0m Cyan    = LDI (load immediate)                ║");
            println!("  ║    \x1b[38;2;255;255;0m██\x1b[0m Yellow  = LOAD (read memory)                  ║");
            println!("  ║    \x1b[38;2;255;0;0m██\x1b[0m Red     = STORE (write memory)                ║");
            println!("  ║    \x1b[38;2;0;255;0m██\x1b[0m Green   = ADD (arithmetic)                    ║");
            println!("  ║    \x1b[38;2;200;0;200m██\x1b[0m Magenta = BRANCH (conditional jump)           ║");
            println!("  ║    \x1b[38;2;255;255;255m██\x1b[0m White   = HALT (stop)                        ║");
            println!("  ║                                                            ║");
            println!("  ║  Original @ 0-17 and replica @ 100-117 are identical.      ║");
            println!("  ║  PPM images written to target/                             ║");
            println!("  ╚════════════════════════════════════════════════════════════╝");
        }

        assert!(replica_ok, "Replica mismatch");
    }
}
