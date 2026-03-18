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
    #[ignore = "Requires GPU - may timeout or hang"]
    fn test_self_hosting_quine_gpu() {
        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state};
        use infinite_map_rs::glyph_assembler::GlyphAssembler;

        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

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

        // Create shadow RAM (64MB)
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));

        // Create scheduler
        let mut scheduler = GlyphVmScheduler::new(
            device.clone(),
            queue.clone(),
            shadow_ram.clone(),
        );

        // Create RAM texture (4096x4096 = 64MB)
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

        scheduler.set_ram_texture(ram_texture);

        println!("\nMemory Layout:");
        println!("  0x0000-0x{:04X}: Binary ({} words)", assembled.words.len(), assembled.words.len());
        println!("  0x1000-0x{:04X}: Source ({} bytes)", 0x1000 + source_text.len(), source_text.len());
        println!("  0x5000-0x5FFF: Output buffer");
        println!("  0x6000-0x7FFF: Label table");

        // Write binary to memory at 0x0000 (TEST: try 500 words)
        println!("\nWriting binary to GPU memory (first 500 words)...");
        for (i, word) in assembled.words.iter().enumerate().take(500) {
            scheduler.poke_substrate_single(i as u32, *word);
        }

        // Write source to memory at 0x1000 (MINIMAL test: only first 100 chars)
        println!("Writing source to GPU memory (first 100 chars only)...");
        for (i, b) in source_text.bytes().enumerate() {
            if i >= 100 {
                break;
            }
            scheduler.poke_substrate_single(0x1000 + i as u32, b as u32);
        }
        scheduler.poke_substrate_single(0x1000 + 100, 0); // null terminator

        println!("Memory initialization complete.");

        // Clear output buffer at 0x5000
        for i in 0..assembled.words.len() + 100 {
            scheduler.poke_substrate_single(0x5000 + i as u32, 0);
        }

        // Verify shadow RAM has correct data before execution
        println!("\nVerifying shadow RAM before execution:");
        println!("  instr[0] = {:08X} (expected {:08X})", scheduler.peek_substrate_single(0), assembled.words[0]);
        println!("  instr[1] = {:08X} (expected {:08X})", scheduler.peek_substrate_single(1), assembled.words[1]);
        println!("  source[0x1000] = {:02X} '{}' ", scheduler.peek_substrate_single(0x1000), scheduler.peek_substrate_single(0x1000) as u8 as char);

        // NOTE: Do NOT call flush_writes() - it doesn't work correctly.
        // execute_frame() will implicitly submit the queued write_texture operations.
        // The working self_compile_execute test doesn't use flush_writes.

        println!("\nSpawning VM at entry point 0x{:04X}...", main_addr);

        // Spawn VM at main (use VM ID 1 like the working tests)
        let config = VmConfig {
            entry_point: main_addr,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(1, &config).expect("Failed to spawn VM");
        println!("VM 1 spawned successfully");

        // CRITICAL DEBUG: Check GPU texture contents right after spawn_vm()
        // spawn_vm() calls queue.submit([]) which should flush write_texture operations
        println!("\n=== GPU TEXTURE VERIFICATION (after spawn_vm) ===");
        scheduler.sync_gpu_to_shadow();
        let gpu_instr_0 = scheduler.peek_substrate_single(0);
        let gpu_instr_1 = scheduler.peek_substrate_single(1);
        let gpu_source_0 = scheduler.peek_substrate_single(0x1000);
        println!("  GPU instr[0] = {:08X} (expected {:08X})", gpu_instr_0, assembled.words[0]);
        println!("  GPU instr[1] = {:08X} (expected {:08X})", gpu_instr_1, assembled.words[1]);
        println!("  GPU source[0x1000] = {:02X} '{}' (expected 2F '/')",
            gpu_source_0, gpu_source_0 as u8 as char);

        if gpu_instr_0 == 0xFFFFFFFF {
            println!("\n  ⚠️  GPU texture is UNINITIALIZED after spawn_vm()!");
            println!("  This means write_texture operations were NOT submitted.");
        } else if gpu_instr_0 == assembled.words[0] {
            println!("\n  ✓ GPU texture has correct data after spawn_vm()!");
        }

        // Restore shadow RAM from assembled data (since sync_gpu_to_shadow may have corrupted it)
        for (i, word) in assembled.words.iter().enumerate() {
            let mut shadow = shadow_ram.lock().unwrap();
            let offset = i * 4;
            shadow[offset..offset + 4].copy_from_slice(&word.to_le_bytes());
        }

        // CRITICAL: Verify GPU texture state right before execute_frame
        // This tells us if the texture is corrupted BY execute_frame or before it
        println!("\n=== PRE-EXECUTE FRAME VERIFICATION ===");
        scheduler.sync_gpu_to_shadow();
        let pre_exec_0 = scheduler.peek_substrate_single(0);
        let pre_exec_1 = scheduler.peek_substrate_single(1);
        println!("  PRE-execute instr[0] = {:08X} (expected {:08X})", pre_exec_0, assembled.words[0]);
        println!("  PRE-execute instr[1] = {:08X} (expected {:08X})", pre_exec_1, assembled.words[1]);

        if pre_exec_0 != assembled.words[0] {
            println!("\n  ⚠️  TEXTURE CORRUPTED BEFORE execute_frame!");
            println!("  This indicates a synchronization issue.");
            panic!("GPU texture corrupted before execution");
        }

        // Restore shadow RAM again after sync
        for (i, word) in assembled.words.iter().enumerate() {
            let mut shadow = shadow_ram.lock().unwrap();
            let offset = i * 4;
            shadow[offset..offset + 4].copy_from_slice(&word.to_le_bytes());
        }

        // CRITICAL TEST: Skip execute_frame and verify texture is preserved
        // This will tell us if execute_frame is corrupting the texture
        println!("\n=== BYPASSING execute_frame - Testing texture preservation ===");
        println!("Skipping compute shader to verify texture data persists...");

        // Use spawn_vm to do a no-op submit (it calls queue.submit internally)
        // This tests if texture is preserved across submits
        let noop_config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        // Spawn a second VM (VM 2) which won't be executed
        scheduler.spawn_vm(2, &noop_config).expect("Failed to spawn noop VM");

        // Verify texture after no-op submit
        scheduler.sync_gpu_to_shadow();
        let noop_instr_0 = scheduler.peek_substrate_single(0);
        println!("  After spawn_vm(2) submit: instr[0] = {:08X} (expected {:08X})", noop_instr_0, assembled.words[0]);

        if noop_instr_0 != assembled.words[0] {
            println!("\n  ⚠️  TEXTURE CORRUPTED BY SPAWN_VM SUBMIT!");
            panic!("GPU texture corrupted by spawn_vm submit");
        } else {
            println!("  ✓ Texture preserved after spawn_vm submit");
        }

        // Restore shadow RAM again
        for (i, word) in assembled.words.iter().enumerate() {
            let mut shadow = shadow_ram.lock().unwrap();
            let offset = i * 4;
            shadow[offset..offset + 4].copy_from_slice(&word.to_le_bytes());
        }

        // NOW run the actual compute shader
        println!("\n=== Running actual execute_frame ===");

        // Execute frames with early termination if halted
        println!("\nExecuting (max 1000 frames)...");
        let max_frames = 1000;
        let mut halted = false;

        for frame in 0..max_frames {
            scheduler.execute_frame();

            if frame % 100 == 0 {
                // Sync and check state every 100 frames
                scheduler.sync_gpu_to_shadow();
                let state = scheduler.get_vm_state(1).unwrap_or(vm_state::INACTIVE);


                if frame % 100 == 0 {
                    // Check PC and first few memory locations
                    let pc = scheduler.peek_substrate_single(0x7000); // VM state area
                    let first_instr = scheduler.peek_substrate_single(0);
                    println!("\n  Frame {}: PC={:04X}, state={}, instr[0]={:08X}",
                        frame, pc, state, first_instr);
                }

                if state == vm_state::HALTED {
                    println!("\nVM halted at frame {}", frame);
                    halted = true;
                    break;
                }

                print!(".");
                std::io::Write::flush(&mut std::io::stdout()).ok();
            }
        }

        if !halted {
            println!("\nVM did not halt within {} frames", max_frames);
        }

        // Check final VM state
        let final_state = scheduler.get_vm_state(1);
        println!("Final VM state: {:?}", final_state);

        // Final sync
        scheduler.sync_gpu_to_shadow();

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
