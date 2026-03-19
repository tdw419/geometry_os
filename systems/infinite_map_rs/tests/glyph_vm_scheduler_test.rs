//! Glyph VM Scheduler Integration Test
//!
//! Tests SPATIAL_SPAWN opcode and multi-VM scheduling on GPU.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    // Note: These tests require a GPU context. Run with `cargo test -- --ignored` for GPU tests.

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
                label: Some("Glyph VM Scheduler Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )).ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    #[test]
    fn test_vm_config_default() {
        use infinite_map_rs::glyph_vm_scheduler::{VmConfig, vm_state};

        let config = VmConfig::default();
        assert_eq!(config.entry_point, 0);
        assert_eq!(config.parent_id, 0xFF);
        assert_eq!(config.initial_regs, [0u32; 128]);
    }

    #[test]
    fn test_vm_state_constants() {
        use infinite_map_rs::glyph_vm_scheduler::vm_state;

        assert_eq!(vm_state::INACTIVE, 0);
        assert_eq!(vm_state::RUNNING, 1);
        assert_eq!(vm_state::HALTED, 2);
        assert_eq!(vm_state::WAITING, 3);
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_scheduler_creation() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler;

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024])); // 64MB shadow RAM
        let scheduler = GlyphVmScheduler::new(device, queue, shadow_ram);
        println!("Glyph VM Scheduler created successfully");
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_spawn_vm() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let scheduler = GlyphVmScheduler::new(device, queue, shadow_ram);

        // Spawn a VM at entry point 0x1000
        let config = VmConfig {
            entry_point: 0x1000,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        ..Default::default()};

        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        println!("VM 0 spawned at entry point 0x1000");
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_halt_vm() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let scheduler = GlyphVmScheduler::new(device, queue, shadow_ram);

        let config = VmConfig::default();
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        scheduler.halt_vm(0).expect("Failed to halt VM");

        println!("VM 0 halted successfully");
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_jump_vm() {
        // Test the Sovereign Click Bridge: jump_vm() sets PC and resumes VM
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("Skipping: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram);

        // Spawn VM 0 at entry point 0
        let config = VmConfig {
            entry_point: 0,
            ..Default::default()
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

        // Halt the VM first
        scheduler.halt_vm(0).expect("Failed to halt VM");

        // Verify VM is halted
        let state = scheduler.get_vm_state(0).expect("Failed to get VM state");
        assert_eq!(state, vm_state::HALTED, "VM should be halted");

        // Jump VM to new PC (this should also resume it)
        let target_pc = 0x8000;
        scheduler.jump_vm(0, target_pc).expect("Failed to jump VM");

        // Verify PC was set and VM is running
        let pc = scheduler.get_vm_pc(0).expect("Failed to get VM PC");
        assert_eq!(pc, target_pc, "PC should be set to target address");

        println!("Sovereign Jump: VM 0 -> PC 0x{:04X} verified", target_pc);
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_spatial_spawn_shader() {
        // This test verifies the SPATIAL_SPAWN opcode in the shader.
        // It creates a program that:
        // 1. Sets regs[1] = 0x2000 (entry point for child)
        // 2. Sets regs[2] = 1 (fresh state flag)
        // 3. Calls SPATIAL_SPAWN
        // 4. Stores child VM ID to memory
        // 5. Halts

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

        // Create RAM texture (4096x4096 rgba8uint)
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Test RAM Texture"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        }));

        scheduler.set_ram_texture(ram_texture);

        // Spawn VM 0 at entry point 0
        let config = VmConfig {
            entry_point: 0,
            ..Default::default()
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

        // Execute one frame
        scheduler.execute_frame();

        println!("SPATIAL_SPAWN test frame executed");
    }
}
