//! Copy Executes Test
//!
//! Tests that the copy of a self-replicating program can itself execute
//! and make another copy. Uses JAL to discover its own PC, making the
//! program position-independent — a true digital quine.
//!
//! Generation 0 → 100: Original copies itself
//! Generation 100 → 200: The COPY copies itself (no CPU help)
//! All three generations are byte-identical.

use std::sync::{Arc, Mutex};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::default(),
        compatible_surface: None,
        force_fallback_adapter: false,
    }))?;
    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Copy Executes"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .ok()?;
    Some((Arc::new(device), Arc::new(queue)))
}

fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    (opcode as u32)
        | ((stratum as u32) << 8)
        | ((p1 as u32) << 16)
        | ((p2 as u32) << 24)
}

/// Position-independent self-replicating program.
///
/// Uses JAL to discover its own PC, then computes:
///   src = base (my location)
///   dst = base + 100 (where to copy)
///
/// This program can execute at ANY address and copy itself
/// to addr + 100. The copy is byte-identical and can itself
/// execute to produce generation N+1.
///
/// Layout (22 pixels):
///   0-1:  JAL r20, 0       ; r20 = PC+2 = base+2
///   2-3:  LDI r21, 2       ; r21 = 2
///   4:    SUB r20, r21     ; r21 = r20 - r21 = base
///   5:    MOV r21, r0      ; r0 = base (src)
///   6-7:  LDI r6, 100      ; r6 = 100 (copy offset)
///   8:    ADD r21, r6      ; r6 = base + 100
///   9:    MOV r6, r1       ; r1 = base + 100 (dst)
///  10-11: LDI r2, 0        ; r2 = counter
///  12-13: LDI r3, 1        ; r3 = increment
///  14-15: LDI r4, 22       ; r4 = program size
///  16:    LOAD r0, r5      ; r5 = mem[src]
///  17:    STORE r1, r5     ; mem[dst] = r5
///  18:    ADD r3, r0       ; src++
///  19:    ADD r3, r1       ; dst++
///  20:    ADD r3, r2       ; counter++
///  21:    BNE r2, r4       ; if counter != size, loop
///  22:    offset -7        ; → addr 16
///  23:    HALT
fn position_independent_replicator() -> Vec<(u32, u32)> {
    vec![
        // Discover base address via JAL
        (0, glyph(16, 0, 20, 0)),     // JAL r20, offset(next pixel)
        (1, 0u32),                     // offset = 0 → r20 = base+2, falls through
        (2, glyph(1, 0, 21, 0)),      // LDI r21
        (3, 2u32),                     // = 2
        (4, glyph(6, 0, 20, 21)),     // SUB: r21 = r20 - r21 = base
        (5, glyph(2, 0, 21, 0)),      // MOV r0 = r21 = base (src)

        // Compute destination = base + 100
        (6, glyph(1, 0, 6, 0)),       // LDI r6
        (7, 100u32),                   // = 100
        (8, glyph(5, 0, 21, 6)),      // ADD: r6 = r21 + r6 = base + 100
        (9, glyph(2, 0, 6, 1)),       // MOV r1 = r6 = base + 100 (dst)

        // Copy loop setup
        (10, glyph(1, 0, 2, 0)),      // LDI r2
        (11, 0u32),                    // = 0 (counter)
        (12, glyph(1, 0, 3, 0)),      // LDI r3
        (13, 1u32),                    // = 1 (increment)
        (14, glyph(1, 0, 4, 0)),      // LDI r4
        (15, 24u32),                   // = 24 (program size)

        // Copy loop body
        (16, glyph(3, 0, 0, 5)),      // LOAD r5 = mem[r0]
        (17, glyph(4, 0, 1, 5)),      // STORE mem[r1] = r5
        (18, glyph(5, 0, 3, 0)),      // ADD r0 += r3 (src++)
        (19, glyph(5, 0, 3, 1)),      // ADD r1 += r3 (dst++)
        (20, glyph(5, 0, 3, 2)),      // ADD r2 += r3 (counter++)
        (21, glyph(10, 1, 2, 4)),     // BNE r2, r4
        (22, (-7i32) as u32),          // offset → addr 16
        (23, glyph(13, 0, 0, 0)),     // HALT
    ]
}

#[test]
#[ignore = "Requires GPU"]
fn copy_executes() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => { println!("SKIP: No GPU"); return; }
    };

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device), Arc::clone(&queue), shadow_ram.clone(),
    );
    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Copy Executes RAM"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1, sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING
            | wgpu::TextureUsages::COPY_DST
            | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    }));
    scheduler.set_ram_texture(ram_texture);

    println!("\n=== COPY EXECUTES: Position-Independent Self-Replication ===\n");

    // Write program at address 0
    let program = position_independent_replicator();
    let prog_size = program.len();
    println!("Program size: {} pixels (position-independent via JAL)\n", prog_size);
    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    // === GENERATION 1: addr 0 copies itself to addr 100 ===
    println!("--- Generation 1: Original at 0 → Copy at 100 ---");
    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0; 128],
    ..Default::default()};
    scheduler.spawn_vm(0, &config).expect("spawn gen 1");
    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    let mut gen1_ok = true;
    for i in 0..prog_size as u32 {
        let src = scheduler.peek_substrate_single(i);
        let dst = scheduler.peek_substrate_single(100 + i);
        if src != dst { gen1_ok = false; }
    }
    println!("  {} Generation 1 (0 → 100)", if gen1_ok { "✓" } else { "✗" });
    assert!(gen1_ok, "Generation 1 failed");

    // === GENERATION 2: copy at 100 copies itself to 200 ===
    // NO CPU PATCHING. The copy at 100 uses JAL to discover
    // its own PC = 100, computes src=100, dst=200 autonomously.
    println!("--- Generation 2: Copy at 100 → Copy at 200 ---");
    let config2 = VmConfig {
        entry_point: 100,
        parent_id: 0,
        base_addr: 0,   // unrestricted
        bound_addr: 0,
        initial_regs: [0; 128],
    ..Default::default()};
    scheduler.spawn_vm(1, &config2).expect("spawn gen 2");
    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    let mut gen2_ok = true;
    for i in 0..prog_size as u32 {
        let src = scheduler.peek_substrate_single(100 + i);
        let dst = scheduler.peek_substrate_single(200 + i);
        if src != dst { gen2_ok = false; }
    }
    println!("  {} Generation 2 (100 → 200)", if gen2_ok { "✓" } else { "✗" });

    // === VERIFICATION: all three generations identical ===
    println!("\n=== VERIFICATION ===\n");
    let mut all_match = true;
    for i in 0..prog_size as u32 {
        let g0 = scheduler.peek_substrate_single(i);
        let g1 = scheduler.peek_substrate_single(100 + i);
        let g2 = scheduler.peek_substrate_single(200 + i);
        let mark = if g0 == g1 && g1 == g2 { "✓" } else { "✗" };
        if g0 != g1 || g1 != g2 { all_match = false; }
        println!("  {} [{:3}] [{:3}] [{:3}]: 0x{:08X} 0x{:08X} 0x{:08X}",
            mark, i, 100+i, 200+i, g0, g1, g2);
    }

    println!();
    if all_match {
        println!("  ╔════════════════════════════════════════════════════════╗");
        println!("  ║  COPIES EXECUTE.                                      ║");
        println!("  ║                                                        ║");
        println!("  ║  Three generations of identical self-replicators.      ║");
        println!("  ║  Position-independent via JAL (discovers own PC).     ║");
        println!("  ║  0 → 100 → 200 with zero CPU intervention.           ║");
        println!("  ╚════════════════════════════════════════════════════════╝");
    } else {
        println!("  FAILED: generations are not identical");
    }
    println!();

    assert!(gen1_ok, "Generation 1 should copy to 100");
    assert!(gen2_ok, "Generation 2 should copy to 200");
    assert!(all_match, "All three generations should be identical");
}

/// Test 5 generations of self-replication: 0→100→200→300→400
#[test]
#[ignore = "Requires GPU"]
fn multiple_copies_concurrent() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => { println!("SKIP: No GPU"); return; }
    };

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device), Arc::clone(&queue), shadow_ram.clone(),
    );
    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Multi-Gen RAM"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1, sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING
            | wgpu::TextureUsages::COPY_DST
            | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    }));
    scheduler.set_ram_texture(ram_texture);

    println!("\n=== 5 GENERATIONS: 0 → 100 → 200 → 300 → 400 ===\n");

    let program = position_independent_replicator();
    let prog_size = program.len();
    for &(addr, val) in &program {
        scheduler.poke_substrate_single(addr, val);
    }

    for gen in 0..5u32 {
        let base = gen * 100;
        let vm_slot = (gen % 8) as u32; // reuse slots
        println!("  Gen {}: executing at {}, copying to {}", gen, base, base + 100);

        let config = VmConfig {
            entry_point: base,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        ..Default::default()};
        scheduler.spawn_vm(vm_slot, &config).expect("spawn");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Verify this generation's copy
        let mut ok = true;
        for i in 0..prog_size as u32 {
            let src = scheduler.peek_substrate_single(base + i);
            let dst = scheduler.peek_substrate_single(base + 100 + i);
            if src != dst { ok = false; }
        }
        let mark = if ok { "✓" } else { "✗" };
        println!("    {} {} → {} copy verified", mark, base, base + 100);
        assert!(ok, "Generation {} failed to copy", gen);
    }

    // Final: verify generation 5 exists at addr 500
    let g0_first = scheduler.peek_substrate_single(0);
    let g5_first = scheduler.peek_substrate_single(500);
    assert_eq!(g0_first, g5_first, "Generation 5 should match generation 0");

    println!();
    println!("  ╔══════════════════════════════════════════════════════════╗");
    println!("  ║  5 GENERATIONS OF SELF-REPLICATION.                     ║");
    println!("  ║  0 → 100 → 200 → 300 → 400 → 500                      ║");
    println!("  ║  Position-independent digital quine.                    ║");
    println!("  ╚══════════════════════════════════════════════════════════╝");
    println!();
}
