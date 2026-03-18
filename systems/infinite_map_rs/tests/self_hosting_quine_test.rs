//! Self-Hosting Quine GPU Test
//!
//! THE ULTIMATE SOVEREIGNTY TEST ON REAL HARDWARE.
//!
//! This test proves that the Glyph VM running on actual GPU hardware can:
//! 1. Load its own binary into memory
//! 2. Load its own source code
//! 3. Compile the source code
//! 4. Produce bit-identical output to the original binary
//!
//! This is the final proof that Geometry OS can self-replicate on GPU.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

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
                label: Some("Self-Hosting Quine Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_self_hosting_quine_gpu() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state};
        use infinite_map_rs::glyph_assembler::GlyphAssembler;

        println!("\n╔════════════════════════════════════════════════════════╗");
        println!("║     SELF-HOSTING QUINE TEST - REAL GPU HARDWARE        ║");
        println!("╚════════════════════════════════════════════════════════╝\n");

        // Load source from disk
        let source_path = "../../systems/glyph_stratum/programs/self_hosting_assembler.glyph";
        let source_text = match std::fs::read_to_string(source_path) {
            Ok(s) => s,
            Err(e) => {
                println!("SKIP: Could not read assembler source: {}", e);
                return;
            }
        };

        // Compile it using the Rust assembler
        let mut assembler = GlyphAssembler::new();
        let assembled = match assembler.assemble(&source_text) {
            Ok(a) => a,
            Err(e) => {
                println!("FAIL: Rust assembler failed: {:?}", e);
                panic!("Rust assembler must work for test setup");
            }
        };

        // Get entry point address
        let main_addr = assembler.get_label_addr("main").unwrap_or(0);

        println!("Source: {} bytes", source_text.len());
        println!("Binary: {} words ({} bytes)", assembled.words.len(), assembled.words.len() * 4);
        println!("Entry point (:main) = 0x{:04X}", main_addr);

        // Create shadow RAM
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024])); // 64MB

        // Create scheduler
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        // Create RAM texture (4096x4096 = 16M pixels = 64MB)
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Self-Hosting Quine RAM"),
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
                | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));

        scheduler.set_ram_texture(ram_texture.clone());

        println!("\nMemory Layout:");
        println!("  0x0000-0x{:04X}: Binary ({} words)", assembled.words.len(), assembled.words.len());
        println!("  0x1000-0x{:04X}: Source ({} bytes)", 0x1000 + source_text.len(), source_text.len());
        println!("  0x5000-0x5FFF: Output buffer");
        println!("  0x6000-0x7FFF: Label table");

        // Write binary to memory at 0x0000
        for (i, word) in assembled.words.iter().enumerate() {
            scheduler.poke_substrate_single(i as u32, *word);
        }

        // Write source to memory at 0x1000
        for (i, b) in source_text.bytes().enumerate() {
            scheduler.poke_substrate_single(0x1000 + i as u32, b as u32);
        }
        scheduler.poke_substrate_single(0x1000 + source_text.len() as u32, 0); // null terminator

        // Clear output buffer at 0x5000
        for i in 0..assembled.words.len() + 100 {
            scheduler.poke_substrate_single(0x5000 + i as u32, 0);
        }

        println!("\nSpawning VM at entry point 0x{:04X}...", main_addr);

        // Spawn VM at main
        let config = VmConfig {
            entry_point: main_addr,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        println!("VM 0 spawned");

        // Execute frames
        println!("\nExecuting (max 10000 frames)...");
        let max_frames = 10000;
        let mut halted = false;

        for frame in 0..max_frames {
            scheduler.execute_frame();
            scheduler.sync_gpu_to_shadow();

            // Check VM state
            let state = scheduler.get_vm_state(0).unwrap_or(vm_state::INACTIVE);
            if state == vm_state::HALTED {
                println!("\nVM halted at frame {}", frame);
                halted = true;
                break;
            }

            if frame % 500 == 0 {
                print!(".");
                std::io::Write::flush(&mut std::io::stdout()).ok();
            }
        }

        if !halted {
            println!("\nVM did not halt within {} frames", max_frames);
        }

        // Read output buffer at 0x5000
        println!("\nReading output buffer...");

        // Compare
        println!("\n╔════════════════════════════════════════════════════════╗");
        println!("║                    VERIFICATION                         ║");
        println!("╚════════════════════════════════════════════════════════╝\n");

        println!("Binary Comparison (first 16 words):");
        println!("  Offset | Original | Compiled | Match");
        println!("  -------|----------|----------|------");

        let mut matches = 0;
        let mut mismatches = 0;
        let mut first_mismatch = None;

        for i in 0..assembled.words.len() {
            let original = assembled.words[i];
            let compiled = scheduler.peek_substrate_single(0x5000 + i as u32);

            if original == compiled {
                matches += 1;
            } else {
                mismatches += 1;
                if first_mismatch.is_none() {
                    first_mismatch = Some((i, original, compiled));
                }
            }

            if i < 16 {
                println!("  {:6} | {:08X} | {:08X} | {}",
                    i, original, compiled, if original == compiled { "✓" } else { "✗" });
            }
        }

        println!("\nResults:");
        println!("  Matches: {}/{}", matches, assembled.words.len());
        println!("  Mismatches: {}", mismatches);

        if let Some((idx, orig, comp)) = first_mismatch {
            println!("\nFirst mismatch at offset {}:", idx);
            println!("  Expected: {:08X}", orig);
            println!("  Got:      {:08X}", comp);
        }

        if mismatches == 0 {
            println!("\n╔════════════════════════════════════════════════════════╗");
            println!("║           ★ GPU SOVEREIGNTY ACHIEVED ★                  ║");
            println!("║                                                        ║");
            println!("║  The GPU assembled itself from source text.            ║");
            println!("║  Output is bit-identical to the original binary.       ║");
            println!("║  No CPU wrote any program logic.                       ║");
            println!("╚════════════════════════════════════════════════════════╝");
        } else {
            println!("\n✗ Sovereignty not yet achieved on GPU.");
            println!("  The synthetic VRAM test passes, but GPU has differences.");
        }

        assert_eq!(mismatches, 0, "Self-hosting quine must produce bit-identical output");
    }
}
