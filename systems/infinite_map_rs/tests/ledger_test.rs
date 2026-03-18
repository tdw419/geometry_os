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
                label: Some("Ledger Test"),
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
    fn test_unified_ledger_provenance() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => return,
        };

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Ledger Test RAM"),
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
        // 0: STORE mem[100], 42 (Opcode 206)
        // 1: HALT (Opcode 13)
        
        let mut prog = vec![0u32; 10];
        prog[0] = 206u32 | (100 << 8) | (42 << 16); 
        prog[1] = 13;

        for (i, &word) in prog.iter().enumerate() {
            scheduler.poke_substrate_single(i as u32, word);
        }
        scheduler.flush_writes();

        // Spawn VM with specific EAP coord and generation
        let config = VmConfig { 
            entry_point: 0, 
            eap_coord: 0x12345678,
            generation: 1,
            ..Default::default() 
        };
        scheduler.spawn_vm(1, &config).unwrap();

        // Execute frame
        println!("Executing frame...");
        scheduler.execute_frame();
        
        // Read ledger
        let ledger = scheduler.read_ledger();
        println!("Ledger entries: {}", ledger.len());
        
        for (i, entry) in ledger.iter().enumerate() {
            println!("  [{}] Time={} Agent={} Action={} Result=0x{:08X} TargetAddr=0x{:08X} EAP=0x{:08X}",
                i, entry.timestamp, entry.agent_id, entry.action_type, entry.result, entry.checksum, entry.eap_coord);
        }

        assert!(ledger.len() >= 1, "Ledger should have at least one entry");
        let write_entry = ledger.iter().find(|e| e.action_type == 15).expect("Should find a MEM_WRITE entry");
        
        assert_eq!(write_entry.agent_id, 1);
        assert_eq!(write_entry.result, 42);
        assert_eq!(write_entry.checksum, 100); // Target address
        assert_eq!(write_entry.eap_coord, 0x12345678);
    }
}
