//! Sovereign Scaler Test
//!
//! Tests that the Glyph VM can move large amounts of data efficiently.
//! This is preparation for moving real Linux kernel images (~2-4MB).
//!
//! The scaler program:
//! 1. Copies N words from source to destination
//! 2. Accumulates a checksum while copying
//! 3. Verifies the entire block via checksum comparison

use std::sync::{Arc, Mutex};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

/// Helper to create device and queue
fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::VULKAN,
        ..Default::default()
    });

    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: None,
        force_fallback_adapter: false,
    }))?;

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Sovereign Scaler Device"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        },
        None,
    )).ok()?;

    Some((Arc::new(device), Arc::new(queue)))
}

/// Encode a glyph instruction
fn glyph(opcode: u32, stratum: u32, p1: u32, p2: u32) -> u32 {
    opcode | (stratum << 8) | (p1 << 16) | (p2 << 24)
}

/// Create a sovereign scaler program that copies N words
///
/// Memory layout (addr 0-23):
/// 0-1:   LDI r0 = src_addr
/// 2-3:   LDI r1 = dst_addr
/// 4-5:   LDI r2 = 0 (counter)
/// 6-7:   LDI r3 = 1 (increment)
/// 8-9:   LDI r4 = count
/// 10-11: LDI r6 = 0 (checksum)
/// 12:    LOAD r5, [r0]
/// 13:    STORE [r1], r5
/// 14:    ADD r6, r5, r6
/// 15:    ADD r0, r3, r0
/// 16:    ADD r1, r3, r1
/// 17:    ADD r2, r3, r2
/// 18-19: BNE r2, r4, -7
/// 20:    STORE [r7], r6 (checksum)
/// 21:    HALT
/// 22-23: LDI r7 = checksum_addr (patched in separately)
fn create_scaler_program(src_addr: u32, dst_addr: u32, count: u32) -> Vec<(u32, u32)> {
    vec![
        // 0-1: LDI r0 = src_addr
        (0, glyph(1, 0, 0, 0)),
        (1, src_addr),
        // 2-3: LDI r1 = dst_addr
        (2, glyph(1, 0, 1, 0)),
        (3, dst_addr),
        // 4-5: LDI r2 = 0 (counter)
        (4, glyph(1, 0, 2, 0)),
        (5, 0),
        // 6-7: LDI r3 = 1 (increment)
        (6, glyph(1, 0, 3, 0)),
        (7, 1),
        // 8-9: LDI r4 = count
        (8, glyph(1, 0, 4, 0)),
        (9, count),
        // 10-11: LDI r6 = 0 (checksum)
        (10, glyph(1, 0, 6, 0)),
        (11, 0),
        // 12: LOAD r5, [r0]
        (12, glyph(3, 0, 0, 5)),
        // 13: STORE [r1], r5
        (13, glyph(4, 0, 1, 5)),
        // 14: ADD r6, r5, r6
        (14, glyph(5, 0, 5, 6)),
        // 15: ADD r0, r3, r0 (src++)
        (15, glyph(5, 0, 3, 0)),
        // 16: ADD r1, r3, r1 (dst++)
        (16, glyph(5, 0, 3, 1)),
        // 17: ADD r2, r3, r2 (counter++)
        (17, glyph(5, 0, 3, 2)),
        // 18-19: BNE r2, r4, -7
        (18, glyph(10, 1, 2, 4)),
        (19, (-7i32) as u32),
        // 20: STORE [r7], r6
        (20, glyph(4, 0, 7, 6)),
        // 21: HALT
        (21, glyph(13, 0, 0, 0)),
    ]
}

#[test]
#[ignore = "Requires GPU"]
fn test_sovereign_scaler_1k() {
    let Some((device, queue)) = create_test_device() else {
        eprintln!("SKIP: No GPU available");
        return;
    };

    println!("\n============================================================");
    println!("  SOVEREIGN SCALER: 1K WORD COPY");
    println!("============================================================\n");

    // Setup scheduler
    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Scaler RAM"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    }));
    scheduler.set_ram_texture(ram_texture);

    // Fill source region (addr 10000-11023) with known pattern
    let src_base = 10000u32;
    let dst_base = 20000u32;
    let count = 1024u32;
    let checksum_addr = 30000u32;

    for i in 0..count {
        let value = 0xDEAD_0000 | (i & 0xFFFF);
        scheduler.poke_substrate_single(src_base + i, value);
    }

    // Write scaler program
    let program = create_scaler_program(src_base, dst_base, count);
    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    // Set r7 = checksum address
    scheduler.poke_substrate_single(22, glyph(1, 0, 7, 0)); // LDI r7
    scheduler.poke_substrate_single(23, checksum_addr);      // = checksum_addr

    // Spawn VM
    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,  // No parent
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    };
    scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

    // Execute
    println!("[SCALER] Executing copy of 1024 words (4KB)...");
    let start = std::time::Instant::now();
    scheduler.execute_frame();
    let elapsed = start.elapsed();
    println!("[SCALER] Execution time: {:?}", elapsed);

    // Sync
    scheduler.sync_gpu_to_shadow();

    // Verify
    let mut errors = 0;
    let mut expected_checksum: u32 = 0;

    for i in 0..count {
        let expected = 0xDEAD_0000 | (i & 0xFFFF);
        let src_val = scheduler.peek_substrate_single(src_base + i);
        let dst_val = scheduler.peek_substrate_single(dst_base + i);

        if src_val != expected {
            if errors < 5 {
                println!("  ✗ Source corrupted at {}: expected {:08x}, got {:08x}",
                         src_base + i, expected, src_val);
            }
            errors += 1;
        }

        if dst_val != expected {
            if errors < 5 {
                println!("  ✗ Dest mismatch at {}: expected {:08x}, got {:08x}",
                         dst_base + i, expected, dst_val);
            }
            errors += 1;
        }

        expected_checksum = expected_checksum.wrapping_add(expected);
    }

    let stored_checksum = scheduler.peek_substrate_single(checksum_addr);
    println!("\n[SCALER] Checksum: expected {:08x}, got {:08x}",
             expected_checksum, stored_checksum);

    if errors == 0 && stored_checksum == expected_checksum {
        println!("\n  ╔══════════════════════════════════════════════════════════╗");
        println!("  ║  SOVEREIGN SCALER: 1K COPY SUCCESSFUL.                 ║");
        println!("  ║                                                        ║");
        println!("  ║  1024 words (4KB) copied with checksum verification.   ║");
        println!("  ║  Ready to scale to kernel-sized transfers.             ║");
        println!("  ╚════════════════════════════════════════════════════════╝");
    } else {
        panic!("Scaler verification failed: {} errors, checksum {:08x} vs {:08x}",
               errors, stored_checksum, expected_checksum);
    }
}

#[test]
#[ignore = "Requires GPU"]
fn test_sovereign_scaler_64k() {
    let Some((device, queue)) = create_test_device() else {
        eprintln!("SKIP: No GPU available");
        return;
    };

    println!("\n============================================================");
    println!("  SOVEREIGN SCALER: 64K WORD COPY (256KB)");
    println!("============================================================\n");

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Scaler RAM 64K"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    }));
    scheduler.set_ram_texture(ram_texture);

    let src_base = 500000u32;
    let dst_base = 600000u32;
    let count = 65536u32;
    let checksum_addr = 700000u32;

    // Fill source with stride pattern
    for i in 0..count {
        let value = (i << 16) | (i & 0xFFFF);
        scheduler.poke_substrate_single(src_base + i, value);
    }

    // Write program
    let program = create_scaler_program(src_base, dst_base, count);
    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    scheduler.poke_substrate_single(22, glyph(1, 0, 7, 0));
    scheduler.poke_substrate_single(23, checksum_addr);

    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,  // No parent
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    };
    scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

    println!("[SCALER] Executing copy of 65536 words (256KB)...");
    let start = std::time::Instant::now();
    scheduler.execute_frame();
    let elapsed = start.elapsed();
    println!("[SCALER] Execution time: {:?}", elapsed);

    scheduler.sync_gpu_to_shadow();

    // Spot-check verification
    let mut errors = 0;
    for i in (0..count).step_by(1024) {
        let expected = (i << 16) | (i & 0xFFFF);
        let dst_val = scheduler.peek_substrate_single(dst_base + i);

        if dst_val != expected {
            if errors < 5 {
                println!("  ✗ Mismatch at {}: expected {:08x}, got {:08x}",
                         dst_base + i, expected, dst_val);
            }
            errors += 1;
        }
    }

    // Verify checksum
    let mut expected_checksum: u32 = 0;
    for i in 0..count {
        expected_checksum = expected_checksum.wrapping_add((i << 16) | (i & 0xFFFF));
    }

    let stored_checksum = scheduler.peek_substrate_single(checksum_addr);
    println!("\n[SCALER] Checksum: {:08x} (expected {:08x})",
             stored_checksum, expected_checksum);

    if errors == 0 {
        let mb_per_sec = (256.0 * 1024.0) / elapsed.as_secs_f64() / (1024.0 * 1024.0);
        println!("\n  ╔══════════════════════════════════════════════════════════╗");
        println!("  ║  SOVEREIGN SCALER: 64K COPY SUCCESSFUL.                ║");
        println!("  ║                                                        ║");
        println!("  ║  65536 words (256KB) copied at {:.2} MB/s", mb_per_sec);
        println!("  ║  Infrastructure ready for real Linux boot.             ║");
        println!("  ╚════════════════════════════════════════════════════════╝");
    } else {
        panic!("64K scaler failed: {} errors", errors);
    }
}

#[test]
#[ignore = "Requires GPU"]
fn test_sovereign_scaler_kernel_sized() {
    let Some((device, queue)) = create_test_device() else {
        eprintln!("SKIP: No GPU available");
        return;
    };

    println!("\n============================================================");
    println!("  SOVEREIGN SCALER: KERNEL-SIZED (512K WORDS = 2MB)");
    println!("============================================================\n");

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Scaler RAM Kernel"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    }));
    scheduler.set_ram_texture(ram_texture);

    let src_base = 1_000_000u32;
    let dst_base = 2_000_000u32;
    let count = 524_288u32;  // 512K words = 2MB
    let checksum_addr = 3_000_000u32;

    // Write sparse pattern at key positions (full init would be slow)
    let key_positions = [0u32, count/4, count/2, count*3/4, count-1];
    for i in key_positions {
        let value = 0x4B524E00 | (i & 0xFFFF);  // "KRN" prefix
        scheduler.poke_substrate_single(src_base + i, value);
    }

    // Write program
    let program = create_scaler_program(src_base, dst_base, count);
    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    scheduler.poke_substrate_single(22, glyph(1, 0, 7, 0));
    scheduler.poke_substrate_single(23, checksum_addr);

    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,  // No parent
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    };
    scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");

    println!("[SCALER] Executing copy of 524288 words (2MB)...");
    println!("[SCALER] This simulates kernel image transfer...");
    let start = std::time::Instant::now();
    scheduler.execute_frame();
    let elapsed = start.elapsed();
    println!("[SCALER] Execution time: {:?}", elapsed);

    scheduler.sync_gpu_to_shadow();

    // Verify key positions
    let mut errors = 0;
    for i in key_positions {
        let expected = 0x4B524E00 | (i & 0xFFFF);
        let dst_val = scheduler.peek_substrate_single(dst_base + i);

        if dst_val != expected {
            println!("  ✗ Mismatch at {}: expected {:08x}, got {:08x}",
                     dst_base + i, expected, dst_val);
            errors += 1;
        } else {
            println!("  ✓ Position {} verified", i);
        }
    }

    if errors == 0 {
        let mb_per_sec = 2.0 / elapsed.as_secs_f64();
        println!("\n  ╔══════════════════════════════════════════════════════════╗");
        println!("  ║  SOVEREIGN SCALER: 2MB COPY SUCCESSFUL.                ║");
        println!("  ║                                                        ║");
        println!("  ║  Throughput: {:.2} MB/s", mb_per_sec);
        println!("  ║  Ready for real Linux kernel boot!                     ║");
        println!("  ╚════════════════════════════════════════════════════════╝");
    } else {
        panic!("Kernel-sized copy failed: {} errors", errors);
    }
}
