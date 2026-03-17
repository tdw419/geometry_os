//! Operand Parser Test
//!
//! Level 4: OPERAND PARSER
//!
//! Proves that a glyph program can parse register identifiers (e.g. 'r', '3')
//! and immediate values (e.g. '4', '2') from ASCII bytes and compile them.

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
                label: Some("Operand Parser Test Device"),
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
    fn test_operand_parser() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::VmConfig;
        let (mut scheduler, _shadow) = setup_scheduler(&device, &queue);

        println!("\n=== LEVEL 4: OPERAND PARSER ===");
        
        // --- 1. The Text Buffer ---
        println!("Writing 'r', '3' into Text Buffer at address 10000...");
        scheduler.poke_substrate_single(10000, 114); // 'r'
        scheduler.poke_substrate_single(10001, 51);  // '3'
        
        println!("Writing '4', '2' into Text Buffer at address 10010...");
        scheduler.poke_substrate_single(10010, 52);  // '4'
        scheduler.poke_substrate_single(10011, 50);  // '2'

        // --- 2. The Atlas ---
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0)); // LDI template

        // --- 3. The Parser Program ---
        
        
        let program: Vec<(u32, u32)> = vec![
            // ==========================================
            // SUB-TEST 1: Parse Register ('r', '3')
            // ==========================================
            
            // r0 = input pointer (10000)
            (0, glyph(1, 0, 0, 0)),
            (1, 10000u32),
            
            // LOAD r1 = 'r'
            (2, glyph(3, 0, 0, 1)),
            
            // r10 = 1 (increment)
            (3, glyph(1, 0, 10, 0)),
            (4, 1u32),
            
            // ADD r0 = r0 + r10 (input++)
            (5, glyph(5, 0, 10, 0)),
            
            // LOAD r2 = '3' (51)
            (6, glyph(3, 0, 0, 2)),
            
            // We want to subtract 48 from r2. 
            // Load 48 into r3
            (7, glyph(1, 0, 3, 0)),
            (8, 48u32),
            
            // SUB: r[p2] = r[p1] - r[p2]. 
            // We want r2 = r2 - r3. So p1=2, p2=3. Then r3 gets the result.
            (9, glyph(6, 0, 2, 3)), // r3 = r2 - r3 = 51 - 48 = 3.
            
            // SHL: shift r3 left by 16 bits.
            // opcode 131: r[p2] = r[p1] << (r[p2] & 31u)
            // We need 16 in r4.
            (10, glyph(1, 0, 4, 0)),
            (11, 16u32),
            
            // r4 = r3 << (r4&31) => r4 = 3 << 16.
            (12, glyph(131, 0, 3, 4)), 
            
            // Store the parsed register mask in address 200
            (13, glyph(1, 0, 5, 0)),
            (14, 200u32),
            (15, glyph(4, 0, 5, 4)), 
            
            // ==========================================
            // SUB-TEST 2: Parse Immediate ('4', '2')
            // ==========================================
            
            // Set input pointer to 10010
            (16, glyph(1, 0, 0, 0)),
            (17, 10010u32),
            
            // Load '4' (52) into r1
            (18, glyph(3, 0, 0, 1)),
            
            // Load 48 into r3
            (19, glyph(1, 0, 3, 0)),
            (20, 48u32),
            
            // Sub 48: r[p2] = r[p1] - r[p2]. r3 = r1 - r3 = 52 - 48 = 4.
            (21, glyph(6, 0, 1, 3)), // r3 = 4
            
            // Move r3 back to r1: ADD r1 = r3 + 0
            // Wait, we need a 0. Let r11 = 0.
            (22, glyph(1, 0, 11, 0)),
            (23, 0u32),
            (24, glyph(5, 0, 3, 11)), // r11 = r3 + 0 = 4. Let's just use r11 as accumulator.
            
            // Accumulator is r11 (value = 4).
            
            // We need to multiply by 10.
            // Load 10 into r6
            (25, glyph(1, 0, 6, 0)),
            (26, 10u32),
            
            // MUL: r[p2] = r[p1] * r[p2]. p1=6, p2=11. r11 = r6 * r11 = 10 * 4 = 40.
            (27, glyph(7, 0, 6, 11)),
            
            // Increment input pointer (r0 = r0 + r10)
            (28, glyph(5, 0, 10, 0)), // r0 = 10011
            
            // Load '2' (50) into r2
            (29, glyph(3, 0, 0, 2)),
            
            // Load 48 into r3
            (30, glyph(1, 0, 3, 0)),
            (31, 48u32),
            
            // Sub 48: r[p2] = r[p1] - r[p2]. r3 = r2 - r3 = 50 - 48 = 2.
            (32, glyph(6, 0, 2, 3)), // r3 = 2
            
            // ADD r11 = r11 + r3 -> r[p2] = r[p1] + r[p2]. p1=3, p2=11. r11 = 2 + 40 = 42.
            (33, glyph(5, 0, 3, 11)),
            
            // Store the parsed immediate in address 201 for verification
            (34, glyph(1, 0, 5, 0)),
            (35, 201u32),
            (36, glyph(4, 0, 5, 11)),
            
            (37, glyph(13, 0, 0, 0)), // HALT
        ];


        println!("Writing Operand Parser program ({} pixels)...", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

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

        let addr_200 = scheduler.peek_substrate_single(200);
        let addr_201 = scheduler.peek_substrate_single(201);

        let expected_reg_mask = 3u32 << 16;
        let expected_imm = 42u32;

        println!("\n=== VERIFICATION ===");
        println!("  addr 200 (Parsed Reg): expected 0x{:08X}, got 0x{:08X}", expected_reg_mask, addr_200);
        println!("  addr 201 (Parsed Imm): expected 0x{:08X}, got 0x{:08X}", expected_imm, addr_201);

        let success = addr_200 == expected_reg_mask && addr_201 == expected_imm;
        
        if success {
            println!("  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  OPERAND PARSER WORKS.                               ║");
            println!("  ║  GPU successfully parsed 'r3' into a register mask.  ║");
            println!("  ║  GPU successfully parsed '42' into an integer.       ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("  FAILED: Operand parsing failed.");
        }

        assert!(success, "Operand parser failed.");
    }
}