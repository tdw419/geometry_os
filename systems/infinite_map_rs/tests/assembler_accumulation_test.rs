//! Assembler Accumulation Test
//!
//! Level 4.1: MULTI-DIGIT ACCUMULATION
//!
//! Targeted test to fix the bug where "50000" was parsed as "50".
//! Proves that the GPU can correctly accumulate (acc * 10) + digit.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};
    use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_accumulator_logic() {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions::default())).unwrap();
        let (device, queue) = pollster::block_on(adapter.request_device(&wgpu::DeviceDescriptor {
            label: Some("Accumulator Test Device"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            ..Default::default()
        }, None)).unwrap();

        let device = Arc::new(device);
        let queue = Arc::new(queue);
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Test RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1, sample_count: 1, dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        // --- 1. ASCII "50000" in Text Buffer ---
        scheduler.poke_substrate_single(10000, 53); // '5'
        scheduler.poke_substrate_single(10001, 48); // '0'
        scheduler.poke_substrate_single(10002, 48); // '0'
        scheduler.poke_substrate_single(10003, 48); // '0'
        scheduler.poke_substrate_single(10004, 48); // '0'
        scheduler.poke_substrate_single(10005, 0);  // Null

        // --- 2. Targeted Accumulator Program ---
        // r0: text_ptr (10000)
        // r6: accumulator
        // r7: multiplier (10)
        // r10: constant 1
        // r11: constant 48 ('0')
        
        
        
        
        
        
        
        
        
        let program = vec![
            (0, glyph(1, 0, 0, 0)), (1, 10000),   // r0 = 10000 (text ptr)
            (2, glyph(1, 0, 6, 0)), (3, 0),       // r6 = 0 (accumulator)
            (4, glyph(1, 0, 7, 0)), (5, 10),      // r7 = 10 (multiplier)
            (6, glyph(1, 0, 10, 0)), (7, 1),      // r10 = 1 (increment)
            (8, glyph(1, 0, 11, 0)), (9, 48),     // r11 = 48 ('0')
            (10, glyph(1, 0, 12, 0)), (11, 0),    // r12 = 0 (null check)
            
            // LOOP START (addr 12)
            (12, glyph(3, 0, 0, 1)),              // r1 = char = mem[r0]
            
            // BEQ r1, r12 (0) -> END
            // PC=13. Instruction takes PC and PC+1. 
            // offset = 24 - (13 + 2) = 9
            (13, glyph(10, 0, 1, 12)), (14, 9i32 as u32), 
            
            // r6 = r7 * r6
            (15, glyph(7, 0, 7, 6)),              
            
            // r8 = 48
            (16, glyph(2, 0, 11, 8)),             
            // r8 = r1 - r8
            (17, glyph(6, 0, 1, 8)),              
            
            // r6 = r8 + r6
            (18, glyph(5, 0, 8, 6)),              
            
            // r0 = r0 + r10
            (19, glyph(5, 0, 10, 0)),             
            
            // Always JMP 12. PC=20. 
            // offset = 12 - (20 + 2) = -10
            (20, glyph(10, 0, 10, 10)), (21, (-10i32) as u32),
            
            // END (addr 22)
            (22, glyph(1, 0, 15, 0)), (23, 200),  
            (24, glyph(4, 0, 15, 6)),             
            (25, glyph(13, 0, 0, 0)),             
        ];










        for &(addr, val) in &program { scheduler.poke_substrate_single(addr, val); }

        let config = VmConfig { entry_point: 0, parent_id: 0xFF, base_addr: 0, bound_addr: 0, initial_regs: [0; 128] };
        scheduler.spawn_vm(0, &config).unwrap();
        for _ in 0..100 { scheduler.execute_frame(); }
        scheduler.sync_gpu_to_shadow();

        let result = scheduler.peek_substrate_single(200);
        println!("\n=== ACCUMULATOR VERIFICATION ===");
        println!("  Parsed value: expected 50000, got {}", result);
        
        assert_eq!(result, 50000, "Multi-digit accumulation failed.");
    }
}
