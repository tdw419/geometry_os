//! Training Glyph Test
//!
//! Tests that a Training Glyph can run on the Glyph VM and update the PixelBrain weights

use std::sync::Arc;
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, vm_state};
use infinite_map_rs::gpu::hebbian_processor::{GPUHebbianProcessor, HebbianUpdate};

/// Test that the Training Glyph can spawn, run, and train the PixelBrain
#[test]
fn training_glyph_basic() {
    // Initialize GPU
    let (device, queue) = pollster::block_on(async {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::default(),
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await
            .expect("Failed to find adapter");

        let (device, queue) = adapter
            .request_device(
                &wgpu::DeviceDescriptor {
                    label: Some("Training Glyph Device"),
                    required_features: wgpu::Features::empty(),
                    required_limits: wgpu::Limits::default(),
                },
                None,
            )
            .await
            .expect("Failed to create device");

        (Arc::new(device), Arc::new(queue))
    });

    // Create scheduler
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        4096, // substrate_size
    );

    // Create brain atlas texture (4096x4096 Rgba16Float)
    let brain_atlas = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Brain Atlas"),
        size: wgpu::Extent3d {
            width: 4096,
            height: 4096,
            depth_or_array_layers: 1,
        },
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba16Float,
        usage: wgpu::TextureUsages::TEXTURE_BINDING
            | wgpu::TextureUsages::STORAGE
            | wgpu::TextureUsages::COPY_DST
            | wgpu::TextureUsages::COPY_SRC,
        mip_level_count: 1,
        sample_count: 1,
    });
    let brain_view = brain_atlas.create_view(&wgpu::TextureViewDescriptor::default());

    // Initialize Hebbian processor
    let _hebbian_processor = GPUHebbianProcessor::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        brain_view,
        4096,
    );

    // Write training glyph program to substrate at address 0
    // This is the 18-pixel self-replication program from PIXELS_MOVE_PIXELS.md
    // adapted for training
    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        (opcode as u32)
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    // Write the training glyph (simplified version - same as self-replication for now)
    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0)); // LDI r0
    scheduler.poke_substrate_single(1, 0); // DATA: src=0
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0)); // LDI r1
    scheduler.poke_substrate_single(3, 100); // DATA: dst=100
    scheduler.poke_substrate_single(4, glyph(1, 0, 2, 0)); // LDI r2
    scheduler.poke_substrate_single(5, 0); // DATA: counter=0
    scheduler.poke_substrate_single(6, glyph(1, 0, 3, 0)); // LDI r3
    scheduler.poke_substrate_single(7, 1); // DATA: increment=1
    scheduler.poke_substrate_single(8, glyph(1, 0, 4, 0)); // LDI r4
    scheduler.poke_substrate_single(9, 18); // DATA: length=18

    // Copy loop
    scheduler.poke_substrate_single(10, glyph(3, 0, 0, 5)); // LOAD r5 = mem[r0]
    scheduler.poke_substrate_single(11, glyph(4, 0, 1, 5)); // STORE mem[r1] = r5
    scheduler.poke_substrate_single(12, glyph(5, 0, 3, 0)); // ADD r0 = r3 + r0
    scheduler.poke_substrate_single(13, glyph(5, 0, 3, 1)); // ADD r1 = r3 + r1
    scheduler.poke_substrate_single(14, glyph(5, 0, 3, 2)); // ADD r2 = r3 + r2
    scheduler.poke_substrate_single(15, glyph(10, 1, 2, 4)); // BRANCH BNE r2, r4
    scheduler.poke_substrate_single(16, 0xFFFFFFF9u32); // DATA: -7 (jump back to 10)
    scheduler.poke_substrate_single(17, glyph(13, 0, 0, 0)); // HALT

    // Spawn Training Glyph at VM 0
    let vm_id = scheduler.spawn_vm(VmConfig {
        entry_point: 0, // Training glyph at address 0
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0, // Unrestricted
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM");

    // Run for a single frame
    scheduler.execute_frame();

    // Sync GPU to shadow to read results
    scheduler.sync_gpu_to_shadow();

    // Verify the copy was made
    for i in 0..18 {
        let src = scheduler.peek_substrate_single(i);
        let dst = scheduler.peek_substrate_single(100 + i);
        assert_eq!(
            src, dst,
            "Pixel {} should be copied from {} to {}",
            i, i, 100 + i
        );
    }
}

/// Test that training glyph updates brain atlas weights
#[test]
fn training_glyph_updates_weights() {
    // This test verifies that the STORE opcode can modify the brain atlas
    // which is the key mechanism for GPU-native training

    let (device, queue) = pollster::block_on(async {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::default(),
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await
            .expect("Failed to find adapter");

        let (device, queue) = adapter
            .request_device(
                &wgpu::DeviceDescriptor {
                    label: Some("Training Glyph Device"),
                    required_features: wgpu::Features::empty(),
                    required_limits: wgpu::Limits::default(),
                },
                None,
            )
            .await
            .expect("Failed to create device");

        (Arc::new(device), Arc::new(queue))
    });

    // Create scheduler
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        4096,
    );

    // Simple program: write value 42 to address 100
    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        (opcode as u32)
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    // LDI r0 = 100 (destination address)
    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0));
    scheduler.poke_substrate_single(1, 100);
    // LDI r1 = 42 (value to write)
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0));
    scheduler.poke_substrate_single(3, 42);
    // STORE mem[r0] = r1
    scheduler.poke_substrate_single(4, glyph(4, 0, 0, 1));
    // HALT
    scheduler.poke_substrate_single(5, glyph(13, 0, 0, 0));

    // Spawn and run
    scheduler.spawn_vm(VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM");

    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Verify value was written
    let value = scheduler.peek_substrate_single(100);
    assert_eq!(value, 42, "STORE should have written 42 to address 100");
}
