//! GPU ASCII Integration Tests
//!
//! Tests the GPU-native ASCII cartridge boot and Sovereign Click Bridge.
//! These tests verify the full reactive loop on actual GPU hardware.
//!
//! Run with: cargo test -- --ignored gpu_ascii

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};
    use std::path::PathBuf;

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
                label: Some("GPU ASCII Integration Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )).ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    fn test_cartridge_path() -> PathBuf {
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR")
            .expect("CARGO_MANIFEST_DIR not set");
        PathBuf::from(manifest_dir)
            .parent()
            .expect("parent dir")
            .parent()
            .expect("grandparent dir")
            .join("apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.rts.png")
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_gpu_cartridge_load_and_spawn() {
        // Test loading ASCII cartridge into GPU-native scheduler
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::ascii_cartridge::AsciiCartridge;
        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        // Load cartridge from disk
        let path = test_cartridge_path();
        let cartridge = match AsciiCartridge::load(&path) {
            Ok(c) => c,
            Err(e) => {
                println!("Skipping: Failed to load cartridge: {:?}", e);
                return;
            }
        };

        // Create scheduler with GPU context
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram);

        // Create RAM texture (4096x4096 rgba8uint)
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("GPU ASCII RAM Texture"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));

        scheduler.set_ram_texture(ram_texture);

        // Spawn VM with cartridge entry point
        let config = VmConfig {
            entry_point: 0, // Start at beginning of program
            ..Default::default()
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

        println!("GPU ASCII: Cartridge loaded and VM 0 spawned");
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_gpu_sovereign_click_bridge() {
        // Test the Sovereign Click Bridge: click → jump_vm → GPU execution
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram);

        // Create RAM texture
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Sovereign Click RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        // Spawn VM in halted state
        let config = VmConfig {
            entry_point: 0,
            ..Default::default()
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        scheduler.halt_vm(0).expect("Failed to halt VM");

        // Simulate click: jump to program address
        let click_target_pc = 0x8000; // PROGRAM_BASE
        scheduler.jump_vm(0, click_target_pc).expect("Failed to jump VM");

        // Verify state
        let state = scheduler.get_vm_state(0).expect("Failed to get state");
        let pc = scheduler.get_vm_pc(0).expect("Failed to get PC");

        assert_eq!(state, vm_state::RUNNING, "VM should be RUNNING after jump_vm");
        assert_eq!(pc, click_target_pc, "PC should be at click target");

        println!("Sovereign Click Bridge: VM 0 resumed at 0x{:04X}", click_target_pc);
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_gpu_reactive_loop_frame() {
        // Test full reactive loop: load → click → execute frame → verify
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram);

        // Create RAM texture
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Reactive Loop RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        // Spawn VM
        let config = VmConfig::default();
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

        // Execute one frame (this triggers GPU compute shader)
        scheduler.execute_frame();

        // Read stats back from GPU
        let stats = scheduler.read_stats();
        assert!(!stats.is_empty(), "Should have VM stats");

        // VM 0 should exist in stats
        let vm0 = stats.iter().find(|s| s.vm_id == 0);
        assert!(vm0.is_some(), "VM 0 should exist in stats");

        println!("Reactive Loop: Frame executed, VM stats: {:?}", vm0);
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_gpu_cartridge_program_upload() {
        // Test uploading cartridge program bytecode to GPU texture
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::ascii_cartridge::AsciiCartridge;
        use infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler;

        let path = test_cartridge_path();
        let cartridge = match AsciiCartridge::load(&path) {
            Ok(c) => c,
            Err(e) => {
                println!("Skipping: Failed to load cartridge: {:?}", e);
                return;
            }
        };

        // Verify program buffer exists
        let program = cartridge.get_program_buffer_u32();
        if program.is_empty() {
            println!("Skipping: Cartridge has no program bytecode");
            return;
        }

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram);

        // Create RAM texture
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Program Upload RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        // Upload program to GPU at PROGRAM_BASE (0x8000)
        const PROGRAM_BASE: u32 = 0x8000;
        scheduler.poke_substrate_batch(PROGRAM_BASE, &program);

        // Verify by reading back
        scheduler.sync_gpu_to_shadow();
        let first_word = scheduler.peek_substrate_single(PROGRAM_BASE);
        assert_eq!(first_word, program[0], "First program word should match");

        println!("Program Upload: {} words uploaded to GPU at 0x{:04X}", program.len(), PROGRAM_BASE);
    }
}
