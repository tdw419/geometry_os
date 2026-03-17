//! Minimal Assembler Test
//!
//! Level 3: MNEMONIC MATCHER
//!
//! Proves that a glyph program can read ASCII bytes from the texture, 
//! match them against "LDI", and emit an instruction.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

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
                label: Some("Assembler Matcher Test Device"),
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
            label: Some("Assembler Test RAM"),
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

    #[test]
    #[ignore = "Requires GPU"]
    fn test_mnemonic_matcher() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::VmConfig;
        let (mut scheduler, _shadow) = setup_scheduler(&device, &queue);

        println!("\n=== LEVEL 3: MNEMONIC MATCHER ===");
        
        // --- 1. The Text Buffer ---
        println!("Writing 'L', 'D', 'I' into Text Buffer at address 10000...");
        // In reality, this would be typed visually. For now we use the raw u32s.
        scheduler.poke_substrate_single(10000, 76); // 'L'
        scheduler.poke_substrate_single(10001, 68); // 'D'
        scheduler.poke_substrate_single(10002, 73); // 'I'
        scheduler.poke_substrate_single(10003, 32); // ' '

        // --- 2. The Atlas ---
        // We need an LDI instruction template in the atlas
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0)); // LDI template

        // --- 3. The Parser Program ---
        // Reads from 10000, checks if it's LDI. If so, emits to 200.
        // We will hardcode r3 and the value 42 for now (Option 2).
        
        // Registers:
        // r0: input string pointer (starts at 10000)
        // r1: loaded character
        // r2: expected character
        // r3: output pointer (200)
        
        let program: Vec<(u32, u32)> = vec![
            // Init input pointer
            (0, glyph(1, 0, 0, 0)),     // LDI r0
            (1, 10000u32),              // DATA: 10000
            
            // --- Parse 'L' ---
            (2, glyph(3, 0, 0, 1)),     // LOAD r1 = mem[r0]
            (3, glyph(1, 0, 2, 0)),     // LDI r2
            (4, 76u32),                 // DATA: 'L'
            // BRANCH BNE (stratum=1), rs1=1, rs2=2. If r1 != r2, jump to END
            (5, glyph(10, 1, 1, 2)),    // BRANCH BNE r1, r2
            (6, 32i32 as u32),          // DATA: jump to END (+32 offset from pc=5. Addr 39)
            
            // Increment input pointer
            (7, glyph(1, 0, 10, 0)),    // LDI r10 (scratch for 1)
            (8, 1u32),                  // DATA: 1
            (9, glyph(5, 0, 10, 0)),    // ADD r0 = r10 + r0

            // --- Parse 'D' ---
            (10, glyph(3, 0, 0, 1)),    // LOAD r1 = mem[r0]
            (11, glyph(1, 0, 2, 0)),    // LDI r2
            (12, 68u32),                // DATA: 'D'
            (13, glyph(10, 1, 1, 2)),   // BRANCH BNE r1, r2
            (14, 24i32 as u32),         // DATA: jump to END (Addr 39)
            
            (15, glyph(5, 0, 10, 0)),   // ADD r0 = r10 + r0 (input++)

            // --- Parse 'I' ---
            (16, glyph(3, 0, 0, 1)),    // LOAD r1 = mem[r0]
            (17, glyph(1, 0, 2, 0)),    // LDI r2
            (18, 73u32),                // DATA: 'I'
            (19, glyph(10, 1, 1, 2)),   // BRANCH BNE r1, r2
            (20, 16i32 as u32),         // DATA: jump to END (Addr 39)
            
            // MATCH FOUND! 
            // Now execute the Patch-and-Copy for "LDI r3"
            
            // Load atlas address into r4
            (21, glyph(1, 0, 4, 0)),     // LDI r4
            (22, 50000u32),              // DATA: 50000 (atlas LDI template)
            
            // Load output address into r3
            (23, glyph(1, 0, 3, 0)),     // LDI r3
            (24, 200u32),                // DATA: 200
            
            // Load the template
            (25, glyph(3, 0, 4, 5)),     // LOAD r5 = mem[r4] -> (1,0,0,0)
            
            // Register mask for r3
            (26, glyph(1, 0, 6, 0)),     // LDI r6
            (27, 3u32 << 16),            // DATA: 3 << 16
            
            // OR the template and mask
            (28, glyph(129, 0, 5, 6)),   // OR r6 = r5 | r6 -> (1,0,3,0)
            
            // STORE patched instruction to output
            (29, glyph(4, 0, 3, 6)),     // STORE mem[r3] = r6 (Write LDI r3)
            
            // Increment output address
            (30, glyph(5, 0, 10, 3)),    // ADD r3 = r10 + r3 (r3 = 201)
            
            // Emitting hardcoded '42'
            (31, glyph(1, 0, 7, 0)),     // LDI r7
            (32, 42u32),                 // DATA: 42
            
            (33, glyph(4, 0, 3, 7)),     // STORE mem[r3] = r7 (Write 42)
            
            // Increment output address
            (34, glyph(5, 0, 10, 3)),    // ADD r3 = r10 + r3 (r3 = 202)
            
            // Emitting HALT (13)
            (35, glyph(1, 0, 8, 0)),     // LDI r8
            (36, glyph(13, 0, 0, 0)),    // DATA: HALT
            
            (37, glyph(4, 0, 3, 8)),     // STORE mem[r3] = r8 (Write HALT)
            
            // END
            (38, glyph(13, 0, 0, 0)),    // HALT
            (39, glyph(13, 0, 0, 0)),    // HALT (error branch target)
        ];

        println!("Writing Mnemonic Matcher program ({} pixels)...", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // --- Execute ---
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // --- Verify ---
        let addr_200 = scheduler.peek_substrate_single(200);
        let addr_201 = scheduler.peek_substrate_single(201);
        let addr_202 = scheduler.peek_substrate_single(202);

        let expected_ldi = glyph(1, 0, 3, 0);  // LDI r3
        let expected_data = 42u32;
        let expected_halt = glyph(13, 0, 0, 0); // HALT

        println!("\n=== VERIFICATION ===");
        println!("  addr 200: expected 0x{:08X} (LDI r3), got 0x{:08X}", expected_ldi, addr_200);
        println!("  addr 201: expected 0x{:08X} (42), got 0x{:08X}", expected_data, addr_201);
        println!("  addr 202: expected 0x{:08X} (HALT), got 0x{:08X}", expected_halt, addr_202);

        let success = addr_200 == expected_ldi && addr_201 == expected_data && addr_202 == expected_halt;
        
        if success {
            println!("  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  MNEMONIC MATCHER WORKS.                             ║");
            println!("  ║  GPU successfully parsed 'L', 'D', 'I'.              ║");
            println!("  ║  It matched the string and compiled the instruction. ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("  FAILED: Mnemonic matching failed.");
        }

        assert!(success, "Mnemonic matcher failed.");
    }
}
