//! Copy Executes Test
//!
//! Tests that the copy of a self-replicating glyph can itself execute and make another copy.
//! This is milestone #2 after self-replication: proving that copies are valid programs.

use std::sync::{Arc, Mutex};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

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
            label: Some("Copy Executes Device"),
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

/// Test that the copy at address 100 can execute and copy itself to address 200
#[test]
#[ignore = "Requires GPU"]
fn copy_executes() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    // Create shadow RAM
    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        shadow_ram.clone(),
    );

    // Create RAM texture
    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Copy Executes RAM"),
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

    // Write the original self-replicating program at address 0
    // This version copies from its own base to base + 100
    let program: Vec<(u32, u32)> = vec![
        // LDI r0 = 0 (source = base address)
        (0, glyph(1, 0, 0, 0)),
        (1, 0),
        // LDI r1 = 100 (destination = base + 100)
        (2, glyph(1, 0, 1, 0)),
        (3, 100),
        // LDI r2 = 0 (counter)
        (4, glyph(1, 0, 2, 0)),
        (5, 0),
        // LDI r3 = 1 (increment)
        (6, glyph(1, 0, 3, 0)),
        (7, 1),
        // LDI r4 = 18 (program length)
        (8, glyph(1, 0, 4, 0)),
        (9, 18),
        // Copy loop:
        // LOAD r5 = mem[r0 + base]
        (10, glyph(3, 0, 0, 5)),
        // STORE mem[r1 + base] = r5
        (11, glyph(4, 0, 1, 5)),
        // ADD r0 = r3 + r0
        (12, glyph(5, 0, 3, 0)),
        // ADD r1 = r3 + r1
        (13, glyph(5, 0, 3, 1)),
        // ADD r2 = r3 + r2
        (14, glyph(5, 0, 3, 2)),
        // BRANCH BNE r2, r4
        (15, glyph(10, 1, 2, 4)),
        // DATA: -7 (jump back)
        (16, (-7i32) as u32),
        // HALT
        (17, glyph(13, 0, 0, 0)),
    ];

    println!("\n=== COPY EXECUTES: Generation Test ===");
    println!("Writing original program at address 0...");

    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    // === GENERATION 1: Original copies itself to 100 ===
    println!("\n--- Generation 1: Original → Copy at 100 ---");

    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    };

    scheduler.spawn_vm(0, &config).expect("Failed to spawn VM 0");
    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Verify first copy
    let mut gen1_match = true;
    for i in 0..18 {
        let src = scheduler.peek_substrate_single(i);
        let dst = scheduler.peek_substrate_single(100 + i);
        if src != dst {
            gen1_match = false;
            println!("  ✗ Gen 1: addr {} != addr {}", i, 100 + i);
        }
    }
    if gen1_match {
        println!("  ✓ Generation 1 complete: 0 → 100");
    }

    // === GENERATION 2: Copy at 100 copies itself to 200 ===
    println!("\n--- Generation 2: Copy at 100 → Copy at 200 ---");

    // Spawn VM 1 at the copy's address
    let config2 = VmConfig {
        entry_point: 100,
        parent_id: 0,
        base_addr: 100,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    };

    scheduler.spawn_vm(1, &config2).expect("Failed to spawn VM 1");
    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Verify second copy
    let mut gen2_match = true;
    for i in 0..18 {
        let src = scheduler.peek_substrate_single(100 + i);
        let dst = scheduler.peek_substrate_single(200 + i);
        if src != dst {
            gen2_match = false;
            println!("  ✗ Gen 2: addr {} != addr {}", 100 + i, 200 + i);
        }
    }
    if gen2_match {
        println!("  ✓ Generation 2 complete: 100 → 200");
    }

    // === VERIFICATION ===
    println!("\n=== FINAL VERIFICATION ===");

    // All three should be identical
    let mut all_match = true;
    for i in 0..18 {
        let orig = scheduler.peek_substrate_single(i);
        let gen1 = scheduler.peek_substrate_single(100 + i);
        let gen2 = scheduler.peek_substrate_single(200 + i);

        if orig == gen1 && gen1 == gen2 {
            println!("  ✓ addr {:3}, {:3}, {:3}: all match (0x{:08X})",
                i, 100 + i, 200 + i, orig);
        } else {
            println!("  ✗ addr {:3}=0x{:08X}, {:3}=0x{:08X}, {:3}=0x{:08X}",
                i, orig, 100 + i, gen1, 200 + i, gen2);
            all_match = false;
        }
    }

    if all_match {
        println!("\n  ╔════════════════════════════════════════════╗");
        println!("  ║   COPIES EXECUTE.                          ║");
        println!("  ║   Three generations of identical glyphs.   ║");
        println!("  ║   0 → 100 → 200                            ║");
        println!("  ╚════════════════════════════════════════════╝\n");
    }

    assert!(gen1_match, "Generation 1 should have copied to 100");
    assert!(gen2_match, "Generation 2 should have copied to 200");
    assert!(all_match, "All three generations should be identical");
}

/// Test that multiple copies can exist and run concurrently
#[test]
#[ignore = "Requires GPU"]
fn multiple_copies_concurrent() {
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
        label: Some("Concurrent Copies RAM"),
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

    // Write simple "write value to address" programs at different locations
    // Program A at 0: writes 111 to address 1000
    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0));  // LDI r0
    scheduler.poke_substrate_single(1, 1000);               // addr
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0));  // LDI r1
    scheduler.poke_substrate_single(3, 111);                // value
    scheduler.poke_substrate_single(4, glyph(4, 0, 0, 1));  // STORE
    scheduler.poke_substrate_single(5, glyph(13, 0, 0, 0)); // HALT

    // Program B at 10: writes 222 to address 2000
    scheduler.poke_substrate_single(10, glyph(1, 0, 0, 0));
    scheduler.poke_substrate_single(11, 2000);
    scheduler.poke_substrate_single(12, glyph(1, 0, 1, 0));
    scheduler.poke_substrate_single(13, 222);
    scheduler.poke_substrate_single(14, glyph(4, 0, 0, 1));
    scheduler.poke_substrate_single(15, glyph(13, 0, 0, 0));

    // Program C at 20: writes 333 to address 3000
    scheduler.poke_substrate_single(20, glyph(1, 0, 0, 0));
    scheduler.poke_substrate_single(21, 3000);
    scheduler.poke_substrate_single(22, glyph(1, 0, 1, 0));
    scheduler.poke_substrate_single(23, 333);
    scheduler.poke_substrate_single(24, glyph(4, 0, 0, 1));
    scheduler.poke_substrate_single(25, glyph(13, 0, 0, 0));

    println!("\n=== CONCURRENT COPIES TEST ===");
    println!("Spawning 3 VMs at addresses 0, 10, 20...");

    // Spawn all three VMs
    scheduler.spawn_vm(0, &VmConfig {
        entry_point: 0, parent_id: 0xFF, base_addr: 0, bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM 0");

    scheduler.spawn_vm(1, &VmConfig {
        entry_point: 10, parent_id: 0xFF, base_addr: 10, bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM 1");

    scheduler.spawn_vm(2, &VmConfig {
        entry_point: 20, parent_id: 0xFF, base_addr: 20, bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM 2");

    // Execute all VMs in one frame
    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Verify all three wrote their values
    let val_a = scheduler.peek_substrate_single(1000);
    let val_b = scheduler.peek_substrate_single(2000);
    let val_c = scheduler.peek_substrate_single(3000);

    println!("  Program A wrote: {} to 1000 (expected 111)", val_a);
    println!("  Program B wrote: {} to 2000 (expected 222)", val_b);
    println!("  Program C wrote: {} to 3000 (expected 333)", val_c);

    assert_eq!(val_a, 111, "Program A should write 111");
    assert_eq!(val_b, 222, "Program B should write 222");
    assert_eq!(val_c, 333, "Program C should write 333");

    println!("\n  ✓ All three programs executed correctly in one frame");
}
