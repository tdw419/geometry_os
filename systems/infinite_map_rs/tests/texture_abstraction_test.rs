//! Texture-Native Abstraction Test
//!
//! Level 1: THE WRITER
//!
//! Proves that a glyph program can copy from an atlas region to an execution region.
//! This is the same LOAD/STORE/BRANCH loop as self-replication, but reading from
//! a different source: the atlas at address 50000 instead of address 0.
//!
//! Level 2: PATCH-AND-COPY
//!
//! Proves that a glyph program can load an instruction template from the atlas,
//! patch in operands using OR, and write a complete instruction.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    /// Encode a glyph instruction as a u32 for poke_substrate_single.
    /// Pixel format is Rgba8Uint: R=opcode, G=stratum, B=p1, A=p2
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
                label: Some("Texture Abstraction Test Device"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    fn setup_scheduler(
        device: &Arc<wgpu::Device>,
        queue: &Arc<wgpu::Queue>,
    ) -> (
        infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler,
        Arc<Mutex<Vec<u8>>>,
    ) {
        use infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler;

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler =
            GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Abstraction Test RAM"),
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
        (scheduler, shadow_ram)
    }

    /// A 4×4 bitmap of the letter 'L', stored as 16 RGBA pixels.
    /// White (0xFFFFFFFF) = lit, Black (0x00000000) = unlit.
    ///
    /// Visual:
    ///   X . . .
    ///   X . . .
    ///   X . . .
    ///   X X X .
    fn letter_l_bitmap() -> [u32; 16] {
        let w = 0xFFFFFFFFu32; // white pixel
        let b = 0x00000000u32; // black pixel
        [
            w, b, b, b, // row 0: X . . .
            w, b, b, b, // row 1: X . . .
            w, b, b, b, // row 2: X . . .
            w, w, w, b, // row 3: X X X .
        ]
    }

    /// The writer program: copies 16 pixels from atlas (50000) to target (100).
    /// Identical structure to the self-replication loop.
    fn writer_program(src: u32, dst: u32, count: u32) -> Vec<(u32, u32)> {
        vec![
            // --- Setup registers ---
            (0, glyph(1, 0, 0, 0)),   // LDI r0
            (1, src),                  // DATA: source (atlas address)
            (2, glyph(1, 0, 1, 0)),   // LDI r1
            (3, dst),                  // DATA: destination
            (4, glyph(1, 0, 2, 0)),   // LDI r2
            (5, 0u32),                 // DATA: counter = 0
            (6, glyph(1, 0, 3, 0)),   // LDI r3
            (7, 1u32),                 // DATA: increment = 1
            (8, glyph(1, 0, 4, 0)),   // LDI r4
            (9, count),                // DATA: number of pixels to copy
            // --- Copy loop ---
            (10, glyph(3, 0, 0, 5)),  // LOAD r5 = mem[r0]
            (11, glyph(4, 0, 1, 5)),  // STORE mem[r1] = r5
            (12, glyph(5, 0, 3, 0)),  // ADD r0 = r3 + r0 (src++)
            (13, glyph(5, 0, 3, 1)),  // ADD r1 = r3 + r1 (dst++)
            (14, glyph(5, 0, 3, 2)),  // ADD r2 = r3 + r2 (counter++)
            (15, glyph(10, 1, 2, 4)), // BRANCH BNE r2, r4
            (16, (-7i32) as u32),      // DATA: offset = -7 (jump to addr 10)
            (17, glyph(13, 0, 0, 0)), // HALT
        ]
    }

    // ========================================================================
    // Level 1: THE WRITER
    // ========================================================================

    #[test]
    #[ignore = "Requires GPU"]
    fn test_writer_copies_from_atlas() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::VmConfig;
        let (mut scheduler, _shadow) = setup_scheduler(&device, &queue);

        // --- Bootstrap the atlas: write letter 'L' at address 50000 ---
        let bitmap = letter_l_bitmap();
        println!("\n=== LEVEL 1: THE WRITER ===");
        println!("Bootstrapping atlas: writing 'L' bitmap at address 50000...");
        for (i, &pixel) in bitmap.iter().enumerate() {
            scheduler.poke_substrate_single(50000 + i as u32, pixel);
        }

        // --- Write the writer program at address 0 ---
        let program = writer_program(50000, 100, 16);
        println!("Writing writer program ({} pixels) at address 0...", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // --- Verify destination is empty ---
        for i in 0..16u32 {
            let val = scheduler.peek_substrate_single(100 + i);
            assert_eq!(val, 0, "Destination addr {} should be 0 before execution", 100 + i);
        }

        // --- Spawn and execute ---
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        println!("VM 0 spawned. Executing frame...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // --- Verify: address 100-115 should match the 'L' bitmap ---
        println!("\n=== VERIFICATION ===\n");
        let mut all_match = true;
        for (i, &expected) in bitmap.iter().enumerate() {
            let dst_addr = 100 + i as u32;
            let actual = scheduler.peek_substrate_single(dst_addr);
            let status = if actual == expected { "✓" } else { "✗" };
            let visual = if expected == 0xFFFFFFFF { "█" } else { "·" };
            // Print in 4×4 grid format
            if i % 4 == 0 && i > 0 {
                println!();
            }
            print!("  {} [{}]", status, visual);
            if actual != expected {
                print!("  addr {}: expected 0x{:08X}, got 0x{:08X}", dst_addr, expected, actual);
                all_match = false;
            }
        }
        println!("\n");

        if all_match {
            println!("  ╔═══════════════════════════════════════════════╗");
            println!("  ║  THE WRITER WORKS.                           ║");
            println!("  ║  GPU copied 'L' from atlas to execution.     ║");
            println!("  ║  Texture-native abstraction is real.         ║");
            println!("  ╚═══════════════════════════════════════════════╝");
        } else {
            println!("  FAILED: Atlas copy did not produce expected output.");
        }
        println!();

        assert!(all_match, "Writer test failed");
    }

    // ========================================================================
    // Level 2: PATCH-AND-COPY
    // ========================================================================

    #[test]
    #[ignore = "Requires GPU"]
    fn test_patch_and_copy() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::VmConfig;
        let (mut scheduler, _shadow) = setup_scheduler(&device, &queue);

        // --- Bootstrap: write instruction templates to atlas ---
        println!("\n=== LEVEL 2: PATCH-AND-COPY ===");
        println!("Bootstrapping atlas with instruction templates...");

        // Instruction templates at atlas base 50000
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0));   // LDI template
        scheduler.poke_substrate_single(50001, glyph(3, 0, 0, 0));   // LOAD template
        scheduler.poke_substrate_single(50002, glyph(4, 0, 0, 0));   // STORE template
        scheduler.poke_substrate_single(50003, glyph(5, 0, 0, 0));   // ADD template
        scheduler.poke_substrate_single(50004, glyph(13, 0, 0, 0));  // HALT template

        // --- Write the patch-and-copy program ---
        //
        // Goal: emit "LDI r3, 42" at address 200-201
        //
        // Strategy:
        //   1. LOAD the LDI template from atlas (50000)
        //   2. LDI a mask with register 3 in the p1 (B channel) position
        //   3. OR them together to get (1, 0, 3, 0)
        //   4. STORE to address 200
        //   5. LDI the data value 42
        //   6. STORE to address 201
        //   7. HALT

        let program: Vec<(u32, u32)> = vec![
            // Load atlas address into r0
            (0, glyph(1, 0, 0, 0)),      // LDI r0
            (1, 50000u32),                // DATA: atlas address of LDI template

            // Load output address into r1
            (2, glyph(1, 0, 1, 0)),      // LDI r1
            (3, 200u32),                  // DATA: output address

            // Load the LDI template from atlas
            (4, glyph(3, 0, 0, 5)),      // LOAD r5 = mem[r0]  → r5 = (1, 0, 0, 0)

            // Load the register patch value: register 3 in B (p1) position
            // We need 0x00030000 = 3 << 16
            (5, glyph(1, 0, 6, 0)),      // LDI r6
            (6, 3u32 << 16),              // DATA: 0x00030000 (register 3 in p1 position)

            // OR to patch: r7 = r5 | r6 = (1, 0, 0, 0) | (0, 0, 3, 0) = (1, 0, 3, 0)
            (7, glyph(129, 0, 5, 6)),    // OR r6 = r5 | r6
            // Note: OR (129) does r[p2] = r[p1] | r[p2], so r6 = r5 | r6

            // Store patched instruction to output address 200
            (8, glyph(4, 0, 1, 6)),      // STORE mem[r1] = r6  → writes (1, 0, 3, 0) to addr 200

            // Now write the data pixel (42) to address 201
            // First increment output pointer
            (9, glyph(1, 0, 7, 0)),      // LDI r7
            (10, 1u32),                    // DATA: 1

            (11, glyph(5, 0, 7, 1)),     // ADD r1 = r7 + r1 (r1 = 201)

            // Load 42 into r8
            (12, glyph(1, 0, 8, 0)),     // LDI r8
            (13, 42u32),                   // DATA: 42

            // Store 42 to address 201
            (14, glyph(4, 0, 1, 8)),     // STORE mem[r1] = r8  → writes 42 to addr 201

            // Now write HALT at address 202
            // Load HALT template from atlas
            (15, glyph(1, 0, 9, 0)),     // LDI r9
            (16, 50004u32),               // DATA: atlas address of HALT template

            (17, glyph(3, 0, 9, 10)),    // LOAD r10 = mem[r9]  → r10 = (13, 0, 0, 0)

            // Increment output pointer to 202
            (18, glyph(5, 0, 7, 1)),     // ADD r1 = r7 + r1 (r1 = 202)

            // Store HALT to address 202
            (19, glyph(4, 0, 1, 10)),    // STORE mem[r1] = r10

            // Done
            (20, glyph(13, 0, 0, 0)),    // HALT
        ];

        println!("Writing patch-and-copy program ({} pixels)...", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // --- Spawn and execute ---
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        println!("VM 0 spawned. Executing frame...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // --- Verify the compiled output ---
        println!("\n=== VERIFICATION ===\n");

        let addr_200 = scheduler.peek_substrate_single(200);
        let addr_201 = scheduler.peek_substrate_single(201);
        let addr_202 = scheduler.peek_substrate_single(202);

        let expected_ldi = glyph(1, 0, 3, 0);  // LDI r3
        let expected_data = 42u32;               // immediate value
        let expected_halt = glyph(13, 0, 0, 0); // HALT

        println!("  addr 200: expected 0x{:08X} (LDI r3),  got 0x{:08X}  {}",
            expected_ldi, addr_200, if addr_200 == expected_ldi { "✓" } else { "✗" });
        println!("  addr 201: expected 0x{:08X} (DATA: 42), got 0x{:08X}  {}",
            expected_data, addr_201, if addr_201 == expected_data { "✓" } else { "✗" });
        println!("  addr 202: expected 0x{:08X} (HALT),     got 0x{:08X}  {}",
            expected_halt, addr_202, if addr_202 == expected_halt { "✓" } else { "✗" });

        let all_match = addr_200 == expected_ldi
            && addr_201 == expected_data
            && addr_202 == expected_halt;

        println!();
        if all_match {
            println!("  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  PATCH-AND-COPY WORKS.                               ║");
            println!("  ║  GPU loaded template, patched register, emitted code.║");
            println!("  ║  The program at 200-202 is:  LDI r3, 42 / HALT      ║");
            println!("  ║  Written entirely by the GPU. No CPU. No Python.     ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("  FAILED: Patch-and-copy output does not match expected.");
        }
        println!();

        assert!(all_match, "Patch-and-copy test failed");
    }
}
