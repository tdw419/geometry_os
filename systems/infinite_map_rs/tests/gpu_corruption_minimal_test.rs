#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};
    use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state};

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let backends = wgpu::Backends::GL | wgpu::Backends::VULKAN;
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends,
            ..Default::default()
        });

        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("GPU Corruption Minimal Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    #[test]
    #[ignore]
    fn test_gpu_corruption_minimal() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => return,
        };

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Minimal Test RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        // Program:
        // 0: NOP
        // 1: HALT
        // ...
        // 2000: NOT mem[0], mem[2010] (PC beyond 1024 cycles)
        // ...
        // 2010: 0x00000000
        
        let mut prog = vec![0u32; 2100];
        prog[0] = 0;             // NOP
        prog[1] = 13;            // HALT
        prog[2000] = 215u32 | (0 << 8) | (2010 << 16); // NOT mem[0], mem[2010]
        prog[2010] = 0;

        for (i, &word) in prog.iter().enumerate() {
            scheduler.poke_substrate_single(i as u32, word);
        }
        scheduler.flush_writes();

        // 2. Spawn VM
        let config = VmConfig { entry_point: 0, ..Default::default() };
        scheduler.spawn_vm(1, &config).unwrap();

        // 3. Execute ONE frame
        println!("Executing frame 0...");
        scheduler.execute_frame();
        
        // 4. Verify results
        scheduler.sync_gpu_to_shadow();
        
        let addr0 = scheduler.peek_substrate_single(0);
        let pc = scheduler.get_vm_pc(1).unwrap();
        let state = scheduler.get_vm_state(1).unwrap();
        
        println!("Addr 0 (instr0): 0x{:08X}", addr0);
        println!("VM 1 PC: {}, state: {}", pc, state);

        assert_eq!(addr0, 0, "Address 0 was corrupted! Expected 0, got 0x{:08X}", addr0);
        assert_eq!(state, 2, "VM should be HALTED (2)");
        assert_eq!(pc, 1, "VM should have halted at PC 1");
    }
}
