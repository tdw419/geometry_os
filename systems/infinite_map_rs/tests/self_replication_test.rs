//! Self-Replicating Glyph Test
//!
//! THE FIRST REAL "PIXELS MOVE PIXELS" TEST.
//!
//! This test writes a tiny glyph program (18 pixels) into the GPU RAM texture.
//! The program copies itself from Hilbert address 0 to address 100.
//! No Python. No new Rust logic. No new WGSL. Just existing opcodes.
//!
//! After execute_frame(), addresses 100-117 should be an exact mirror of 0-17.
//! The GPU moved its own pixels.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    /// Encode a glyph instruction as a u32 for poke_substrate_single.
    /// Pixel format is Rgba8Uint: R=opcode, G=stratum, B=p1, A=p2
    /// poke writes val.to_le_bytes() → [R, G, B, A]
    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            dx12_shader_compiler: wgpu::Dx12Compiler::default(),
            ..Default::default()
        });

        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Self-Replication Test Device"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    /// The self-replicating glyph program.
    ///
    /// 18 pixels that copy themselves from address 0 to address 100.
    ///
    /// Uses the REAL opcodes from src/shaders/glyph_vm_scheduler.wgsl:
    ///   LDI (1)   = 2-pixel: r[p1] = next_pixel_as_u32
    ///   LOAD (3)  = r[p2] = mem[r[p1]]  (Hilbert address)
    ///   STORE (4) = mem[r[p1]] = r[p2]
    ///   ADD (5)   = r[p2] = r[p1] + r[p2]  (register + register)
    ///   BRANCH (10) = conditional, stratum=cond_type, next pixel = PC-relative offset
    ///   HALT (13) = stop
    fn self_replicating_program() -> Vec<(u32, u32)> {
        // (hilbert_address, value) pairs
        let program_len: u32 = 18;
        let dst_addr: u32 = 100;

        vec![
            // --- Setup registers ---
            // Addr 0: LDI r0 (source address)
            (0, glyph(1, 0, 0, 0)),
            // Addr 1: DATA = 0 (we start copying from address 0)
            (1, 0u32),
            // Addr 2: LDI r1 (destination address)
            (2, glyph(1, 0, 1, 0)),
            // Addr 3: DATA = 100 (copy to address 100)
            (3, dst_addr),
            // Addr 4: LDI r2 (counter, starts at 0)
            (4, glyph(1, 0, 2, 0)),
            // Addr 5: DATA = 0
            (5, 0u32),
            // Addr 6: LDI r3 (increment value = 1)
            (6, glyph(1, 0, 3, 0)),
            // Addr 7: DATA = 1
            (7, 1u32),
            // Addr 8: LDI r4 (program length)
            (8, glyph(1, 0, 4, 0)),
            // Addr 9: DATA = 18 (number of pixels to copy)
            (9, program_len),
            // --- Copy loop ---
            // Addr 10: LOAD r5 = mem[r0]  (read glyph at source)
            (10, glyph(3, 0, 0, 5)),
            // Addr 11: STORE mem[r1] = r5  (write glyph to destination)
            (11, glyph(4, 0, 1, 5)),
            // Addr 12: ADD r0 = r3 + r0  (src++)
            (12, glyph(5, 0, 3, 0)),
            // Addr 13: ADD r1 = r3 + r1  (dst++)
            (13, glyph(5, 0, 3, 1)),
            // Addr 14: ADD r2 = r3 + r2  (counter++)
            (14, glyph(5, 0, 3, 2)),
            // Addr 15: BRANCH BNE r2, r4  (if counter != program_len, loop)
            //          stratum=1 (BNE), p1=2 (r2), p2=4 (r4)
            (15, glyph(10, 1, 2, 4)),
            // Addr 16: DATA = -7 as u32 (PC-relative offset: 15 + 2 + (-7) = 10)
            (16, (-7i32) as u32),
            // Addr 17: HALT
            (17, glyph(13, 0, 0, 0)),
        ]
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_pixels_move_pixels() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        // --- Setup ---
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        // Create RAM texture (4096x4096 rgba8uint)
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Self-Replication RAM"),
            size: wgpu::Extent3d {
                width: 4096,
                height: 4096,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING
                | wgpu::TextureUsages::COPY_DST
                | wgpu::TextureUsages::COPY_SRC, // needed for sync_gpu_to_shadow
            view_formats: &[],
        }));

        scheduler.set_ram_texture(ram_texture);

        // --- Write the program (THE FROZEN BOOTSTRAP) ---
        let program = self_replicating_program();
        println!("\n=== PIXELS MOVE PIXELS: Self-Replicating Glyph ===");
        println!("Writing {} pixels to RAM texture...", program.len());

        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
            let bytes = val.to_le_bytes();
            println!(
                "  addr {:3}: R={:3} G={:3} B={:3} A={:3}  (0x{:08X})",
                addr, bytes[0], bytes[1], bytes[2], bytes[3], val
            );
        }

        // --- Verify source pixels were written ---
        println!("\nVerifying source pixels in shadow RAM...");
        for &(addr, expected) in &program {
            let actual = scheduler.peek_substrate_single(addr);
            assert_eq!(
                actual, expected,
                "Source pixel at addr {} mismatch: expected 0x{:08X}, got 0x{:08X}",
                addr, expected, actual
            );
        }
        println!("  ✓ All {} source pixels verified", program.len());

        // --- Verify destination is empty before execution ---
        println!("\nVerifying destination (addr 100-117) is empty...");
        for i in 0..18u32 {
            let val = scheduler.peek_substrate_single(100 + i);
            assert_eq!(
                val, 0,
                "Destination addr {} should be 0 before execution, got 0x{:08X}",
                100 + i,
                val
            );
        }
        println!("  ✓ Destination is clean");

        // --- Spawn VM 0 at address 0 ---
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0, // unrestricted
            initial_regs: [0; 128],
        ..Default::default()};
        scheduler
            .spawn_vm(0, &config)
            .expect("Failed to spawn VM 0");
        println!("\nVM 0 spawned at entry point 0");

        // --- Execute ---
        println!("Executing frame...");
        scheduler.execute_frame();
        println!("Frame complete.");

        // --- Sync GPU→CPU ---
        println!("Syncing GPU texture to shadow RAM...");
        scheduler.sync_gpu_to_shadow();

        // --- THE MOMENT OF TRUTH ---
        println!("\n=== VERIFICATION: Did pixels move pixels? ===\n");

        let mut all_match = true;
        for &(src_addr, expected) in &program {
            let dst_addr = 100 + src_addr;
            let actual = scheduler.peek_substrate_single(dst_addr);
            let status = if actual == expected { "✓" } else { "✗" };
            println!(
                "  {} addr {:3} → addr {:3}: expected 0x{:08X}, got 0x{:08X}",
                status, src_addr, dst_addr, expected, actual
            );
            if actual != expected {
                all_match = false;
            }
        }

        println!();
        if all_match {
            println!("  ╔══════════════════════════════════════════╗");
            println!("  ║   PIXELS MOVED PIXELS.                  ║");
            println!("  ║   18 glyphs copied themselves on GPU.   ║");
            println!("  ║   No Python. No CPU. Just light.        ║");
            println!("  ╚══════════════════════════════════════════╝");
        } else {
            println!("  FAILED: Some pixels did not copy correctly.");
        }
        println!();

        assert!(all_match, "Self-replication failed: destination does not match source");

        // --- Bonus: verify source is still intact ---
        println!("Verifying source pixels are still intact...");
        for &(addr, expected) in &program {
            let actual = scheduler.peek_substrate_single(addr);
            assert_eq!(
                actual, expected,
                "Source pixel at addr {} was corrupted! Expected 0x{:08X}, got 0x{:08X}",
                addr, expected, actual
            );
        }
        println!("  ✓ Source pixels intact. Self-replication is non-destructive.");
    }
}
