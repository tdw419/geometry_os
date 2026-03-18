//! Training Glyph Test
//!
//! Tests that a Training Glyph can run on the Glyph VM and update the PixelBrain weights

use std::sync::{Arc, Mutex};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};
// Hebbian processor would be used for actual weight updates in a full training glyph

/// Helper to create device and queue
fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());

    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::default(),
        compatible_surface: None,
        force_fallback_adapter: false,
    }))?;

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Training Glyph Device"),
            required_features: wgpu::Features::empty(),
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .ok()?;

    Some((Arc::new(device), Arc::new(queue)))
}

/// Helper to encode an instruction
fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    (opcode as u32)
        | ((stratum as u32) << 8)
        | ((p1 as u32) << 16)
        | ((p2 as u32) << 24)
}

/// Test that the Training Glyph can spawn, run, and copy itself
#[test]
#[ignore = "Requires GPU"]
fn training_glyph_basic() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    // Create shadow RAM (64 MB = 4096 * 4096 * 4 bytes)
    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        shadow_ram.clone(),
    );

    // Create RAM texture (4096x4096 rgba8uint)
    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Training Glyph RAM"),
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

    // Write the training glyph (18-pixel self-replication program)
    // This program copies itself from address 0 to address 100
    let program: Vec<(u32, u32)> = vec![
        (0, glyph(1, 0, 0, 0)),   // LDI r0
        (1, 0),                    // DATA: src=0
        (2, glyph(1, 0, 1, 0)),   // LDI r1
        (3, 100),                  // DATA: dst=100
        (4, glyph(1, 0, 2, 0)),   // LDI r2
        (5, 0),                    // DATA: counter=0
        (6, glyph(1, 0, 3, 0)),   // LDI r3
        (7, 1),                    // DATA: increment=1
        (8, glyph(1, 0, 4, 0)),   // LDI r4
        (9, 18),                   // DATA: length=18
        (10, glyph(3, 0, 0, 5)),  // LOAD r5 = mem[r0]
        (11, glyph(4, 0, 1, 5)),  // STORE mem[r1] = r5
        (12, glyph(5, 0, 3, 0)),  // ADD r0 = r3 + r0
        (13, glyph(5, 0, 3, 1)),  // ADD r1 = r3 + r1
        (14, glyph(5, 0, 3, 2)),  // ADD r2 = r3 + r2
        (15, glyph(10, 1, 2, 4)), // BRANCH BNE r2, r4
        (16, (-7i32) as u32),     // DATA: -7 (jump back to 10)
        (17, glyph(13, 0, 0, 0)), // HALT
    ];

    println!("\n=== TRAINING GLYPH: Self-Replication Test ===");
    println!("Writing {} pixels to RAM texture...", program.len());

    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    // Spawn Training Glyph at VM 0
    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    ..Default::default()};

    scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

    // Run for a single frame
    scheduler.execute_frame();

    // Sync GPU to shadow to read results
    scheduler.sync_gpu_to_shadow();

    // Verify the copy was made
    println!("\n=== VERIFICATION: Did pixels move pixels? ===\n");

    let mut all_match = true;
    for i in 0..18 {
        let src = scheduler.peek_substrate_single(i);
        let dst = scheduler.peek_substrate_single(100 + i);
        let expected = program[i as usize].1;

        if src == dst && src == expected {
            println!("  ✓ addr {:3} → addr {:3}: expected 0x{:08X}, got 0x{:08X}",
                i, 100 + i, expected, dst);
        } else {
            println!("  ✗ addr {:3} → addr {:3}: expected 0x{:08X}, got 0x{:08X}",
                i, 100 + i, expected, dst);
            all_match = false;
        }
    }

    if all_match {
        println!("\n  ╔══════════════════════════════════════════╗");
        println!("  ║   PIXELS MOVED PIXELS.                  ║");
        println!("  ║   Training glyph copied itself on GPU.  ║");
        println!("  ║   No CPU. Just light.                   ║");
        println!("  ╚══════════════════════════════════════════╝\n");
    }

    assert!(all_match, "Training glyph should have copied itself");
}

/// Test that STORE opcode can modify memory (key for GPU-native training)
#[test]
#[ignore = "Requires GPU"]
fn training_glyph_updates_memory() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    // Create scheduler
    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        shadow_ram.clone(),
    );

    // Create RAM texture
    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Training Glyph RAM"),
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

    // Simple program: write value 42 to address 100
    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0)); // LDI r0
    scheduler.poke_substrate_single(1, 100);               // DATA: addr=100
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0)); // LDI r1
    scheduler.poke_substrate_single(3, 42);                // DATA: value=42
    scheduler.poke_substrate_single(4, glyph(4, 0, 0, 1)); // STORE mem[r0] = r1
    scheduler.poke_substrate_single(5, glyph(13, 0, 0, 0)); // HALT

    // Spawn and run
    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    ..Default::default()};

    scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Verify value was written
    let value = scheduler.peek_substrate_single(100);
    assert_eq!(value, 42, "STORE should have written 42 to address 100");

    println!("✓ STORE opcode successfully modified memory at address 100");
}
