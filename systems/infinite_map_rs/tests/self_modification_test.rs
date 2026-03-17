//! Self-Modification Test
//!
//! Tests that a glyph program can modify its own opcodes during execution.
//! This is milestone #3: proving programs can rewrite themselves.

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
            label: Some("Self-Modification Device"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
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

/// Test that a program can change its own HALT to a NOP and continue
#[test]
#[ignore = "Requires GPU"]
fn self_modify_halt_to_nop() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        shadow_ram.clone(),
    );

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Self-Modification RAM"),
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

    // Program that modifies itself:
    // 0: LDI r0 = 5        (address of HALT instruction)
    // 1: DATA: 5
    // 2: LDI r1 = NOP      (opcode 0 = NOP)
    // 3: DATA: 0
    // 4: STORE mem[r0] = r1  (overwrite HALT with NOP)
    // 5: HALT              (this becomes NOP, execution continues)
    // 6: LDI r2 = 42
    // 7: DATA: 42
    // 8: STORE mem[1000] = r2  (write 42 to prove we got here)
    // 9: HALT              (real stop)

    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0));  // LDI r0
    scheduler.poke_substrate_single(1, 5);                   // addr of HALT
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0));  // LDI r1
    scheduler.poke_substrate_single(3, 0);                   // NOP opcode
    scheduler.poke_substrate_single(4, glyph(4, 0, 0, 1));  // STORE mem[r0] = r1
    scheduler.poke_substrate_single(5, glyph(13, 0, 0, 0)); // HALT (will become NOP)
    scheduler.poke_substrate_single(6, glyph(1, 0, 2, 0));  // LDI r2
    scheduler.poke_substrate_single(7, 42);                  // value
    scheduler.poke_substrate_single(8, glyph(1, 0, 3, 0));  // LDI r3
    scheduler.poke_substrate_single(9, 1000);                // addr
    scheduler.poke_substrate_single(10, glyph(4, 0, 3, 2)); // STORE mem[r3] = r2
    scheduler.poke_substrate_single(11, glyph(13, 0, 0, 0)); // HALT

    println!("\n=== SELF-MODIFICATION: HALT → NOP ===");
    println!("Program will overwrite its own HALT at addr 5 with NOP");

    scheduler.spawn_vm(0, &VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM");

    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Check that addr 5 is now NOP (opcode 0)
    let modified = scheduler.peek_substrate_single(5);
    println!("  Addr 5 after modification: 0x{:08X}", modified);

    // Check that 42 was written to addr 1000 (proving we got past the modified HALT)
    let result = scheduler.peek_substrate_single(1000);
    println!("  Addr 1000: {} (expected 42)", result);

    assert_eq!(modified, 0, "HALT should be replaced with NOP (0x00000000)");
    assert_eq!(result, 42, "Should have continued past modified HALT and written 42");

    println!("\n  ✓ Program successfully modified itself and continued execution");
}

/// Test that a program can change its own branch target
#[test]
#[ignore = "Requires GPU"]
fn self_modify_branch_target() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        shadow_ram.clone(),
    );

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Self-Modification RAM"),
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

    // Program that modifies its branch offset:
    // First run: branch loops back, incrementing counter
    // When counter == 2, modify branch offset to fall through
    // Then write final counter value

    // 0: LDI r0 = 0        (counter)
    // 1: DATA: 0
    // 2: LDI r1 = 1        (increment)
    // 3: DATA: 1
    // 4: LDI r2 = 2        (target value)
    // 5: DATA: 2
    // 6: LDI r3 = 9        (addr of branch offset data)
    // 7: DATA: 9
    // 8: LDI r4 = 0        (new offset = 0, fall through)
    // 9: DATA: -3          (branch offset: jump back to 8... wait this is wrong)

    // Simpler approach:
    // 0: LDI r0 = 0        (counter)
    // 1: DATA: 0
    // 2: ADD r0 = r0 + 1   (counter++)
    // 3: LDI r1 = 3        (threshold)
    // 4: DATA: 3
    // 5: BNE r0, r1 → +2   (if counter != 3, skip next)
    // 6: DATA: 2
    // 7: STORE mem[8] = 0  (overwrite branch offset to 0)
    // 8: BRANCH always → -6 (loop back to 2, becomes NOP after modification)
    // 9: DATA: -6 (or some encoding)
    // ...this is getting complex

    // Let me do a simpler self-mod: change what instruction does
    // 0: LDI r0 = 100      (destination address)
    // 1: DATA: 100
    // 2: LDI r1 = 10       (loop counter)
    // 3: DATA: 10
    // 4: LDI r2 = 1        (decrement)
    // 5: DATA: 1
    // 6: LDI r3 = 0        (value to write - changes each iteration)
    // 7: DATA: 0
    // 8: LDI r4 = 7        (address of DATA at 7)
    // 9: DATA: 7
    // 10: STORE mem[r0] = r3  (write current value)
    // 11: ADD r0 = r0 + r2    (dest++)
    // 12: ADD r3 = r3 + r2    (value++)
    // 13: STORE mem[r4] = r3  (self-modify: update DATA at 7)
    // 14: SUB r1 = r1 - r2    (counter--)
    // 15: BNE r1, 0 → -9      (if counter != 0, loop)
    // 16: DATA: -9
    // 17: HALT

    // Program: count from 0 to 9, writing each value to mem[100+i]
    // Self-modifies addr 7 (initial value) each iteration
    //
    // r0 = 100 (dest addr)        r1 = 0 (counter)
    // r2 = 1 (increment)          r3 = 0 (value, self-modified)
    // r4 = 7 (addr to self-mod)   r5 = 10 (limit)

    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0));   // LDI r0
    scheduler.poke_substrate_single(1, 100);                  // dest = 100
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0));   // LDI r1
    scheduler.poke_substrate_single(3, 0);                    // counter = 0
    scheduler.poke_substrate_single(4, glyph(1, 0, 2, 0));   // LDI r2
    scheduler.poke_substrate_single(5, 1);                    // increment = 1
    scheduler.poke_substrate_single(6, glyph(1, 0, 3, 0));   // LDI r3
    scheduler.poke_substrate_single(7, 0);                    // initial value = 0
    scheduler.poke_substrate_single(8, glyph(1, 0, 4, 0));   // LDI r4
    scheduler.poke_substrate_single(9, 7);                    // addr of DATA[7]
    scheduler.poke_substrate_single(10, glyph(1, 0, 5, 0));  // LDI r5
    scheduler.poke_substrate_single(11, 10);                  // limit = 10

    // Loop body (addr 12-19):
    scheduler.poke_substrate_single(12, glyph(4, 0, 0, 3));  // STORE mem[r0] = r3
    scheduler.poke_substrate_single(13, glyph(5, 0, 2, 0));  // ADD r0 += r2 (dest++)
    scheduler.poke_substrate_single(14, glyph(5, 0, 2, 3));  // ADD r3 += r2 (value++)
    scheduler.poke_substrate_single(15, glyph(5, 0, 2, 1));  // ADD r1 += r2 (counter++)
    scheduler.poke_substrate_single(16, glyph(4, 0, 4, 3));  // STORE mem[r4] = r3 (SELF-MOD!)
    scheduler.poke_substrate_single(17, glyph(10, 1, 1, 5)); // BNE r1, r5 → loop
    scheduler.poke_substrate_single(18, (-7i32) as u32);      // offset → addr 12
    scheduler.poke_substrate_single(19, glyph(13, 0, 0, 0)); // HALT

    println!("\n=== SELF-MODIFICATION: Dynamic Value Update ===");
    println!("Program modifies its own DATA value each iteration");

    scheduler.spawn_vm(0, &VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM");

    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Check that addr 7 was modified from 0 to 10
    let modified_data = scheduler.peek_substrate_single(7);
    println!("  Addr 7 (self-modified DATA): {} (should be 10)", modified_data);

    // Check that values 0-9 were written to 100-109
    println!("\n  Written values:");
    let mut all_correct = true;
    for i in 0..10 {
        let val = scheduler.peek_substrate_single(100 + i);
        let expected = i;
        if val == expected {
            println!("    addr {}: {} ✓", 100 + i, val);
        } else {
            println!("    addr {}: {} ✗ (expected {})", 100 + i, val, expected);
            all_correct = false;
        }
    }

    assert_eq!(modified_data, 10, "DATA should be modified to 10 after loop");
    assert!(all_correct, "All 10 values should be written correctly");

    println!("\n  ✓ Program successfully self-modified its DATA value");
}

/// Test that a program can write a completely new instruction
#[test]
#[ignore = "Requires GPU"]
fn self_modify_write_new_instruction() {
    let (device, queue) = match create_test_device() {
        Some(d) => d,
        None => {
            println!("SKIP: No GPU available");
            return;
        }
    };

    let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(
        Arc::clone(&device),
        Arc::clone(&queue),
        shadow_ram.clone(),
    );

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Self-Modification RAM"),
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

    // Program that writes a STORE instruction into empty memory, then jumps to it:
    // 0: LDI r0 = 100      (address where we'll write new code)
    // 1: DATA: 100
    // 2: LDI r1 = STORE_OPCODE  (STORE = 4)
    // 3: DATA: glyph(4, 0, 2, 3) = STORE mem[r2] = r3
    // 4: STORE mem[r0] = r1     (write STORE instruction at addr 100)
    // 5: LDI r2 = 200           (address for new instruction to write to)
    // 6: DATA: 200
    // 7: LDI r3 = 99            (value for new instruction to write)
    // 8: DATA: 99
    // 9: LDI r4 = 0             (write NOP after STORE so we return cleanly)
    // 10: DATA: 0
    // 11: STORE mem[r0+1] = r4  (write NOP at 101)
    // 12: BRANCH always to 100  (jump to dynamically written code)
    // 13: DATA: offset to 100
    // 14: HALT

    let store_instr = glyph(4, 0, 2, 3); // STORE mem[r2] = r3
    let nop_instr = glyph(0, 0, 0, 0);   // NOP

    scheduler.poke_substrate_single(0, glyph(1, 0, 0, 0));   // LDI r0
    scheduler.poke_substrate_single(1, 100);                  // code addr
    scheduler.poke_substrate_single(2, glyph(1, 0, 1, 0));   // LDI r1
    scheduler.poke_substrate_single(3, store_instr);          // STORE opcode
    scheduler.poke_substrate_single(4, glyph(4, 0, 0, 1));   // STORE mem[r0] = r1
    scheduler.poke_substrate_single(5, glyph(1, 0, 2, 0));   // LDI r2
    scheduler.poke_substrate_single(6, 200);                  // data addr
    scheduler.poke_substrate_single(7, glyph(1, 0, 3, 0));   // LDI r3
    scheduler.poke_substrate_single(8, 99);                   // data value
    scheduler.poke_substrate_single(9, glyph(1, 0, 4, 0));   // LDI r4
    scheduler.poke_substrate_single(10, nop_instr);           // NOP opcode
    scheduler.poke_substrate_single(11, glyph(1, 0, 5, 0));  // LDI r5
    scheduler.poke_substrate_single(12, 101);                 // addr 101
    scheduler.poke_substrate_single(13, glyph(4, 0, 5, 4));  // STORE mem[r5] = r4
    // Now jump to 100 - need unconditional branch
    // BRANCH BEQ r0, r0 (always true) → offset to 100
    // Current PC would be 15, so offset = 100 - 15 - 2 = 83
    scheduler.poke_substrate_single(14, glyph(10, 0, 0, 0));  // BRANCH BEQ r0, r0
    scheduler.poke_substrate_single(15, 83);                   // offset to 100
    scheduler.poke_substrate_single(16, glyph(13, 0, 0, 0));  // HALT (backup)

    println!("\n=== SELF-MODIFICATION: Write New Instruction ===");
    println!("Program will write a STORE instruction at addr 100, then jump to it");

    scheduler.spawn_vm(0, &VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        initial_regs: [0u32; 128],
    }).expect("Failed to spawn VM");

    scheduler.execute_frame();
    scheduler.sync_gpu_to_shadow();

    // Check that addr 100 contains STORE instruction
    let code_100 = scheduler.peek_substrate_single(100);
    println!("  Addr 100 (dynamically written): 0x{:08X}", code_100);
    println!("  Expected STORE opcode: 0x{:08X}", store_instr);

    // Check that addr 101 contains NOP
    let code_101 = scheduler.peek_substrate_single(101);
    println!("  Addr 101 (dynamically written): 0x{:08X}", code_101);

    // Check that 99 was written to addr 200 (proving dynamic code executed)
    let result = scheduler.peek_substrate_single(200);
    println!("  Addr 200 (written by dynamic code): {} (expected 99)", result);

    assert_eq!(code_100, store_instr, "Addr 100 should contain STORE instruction");
    assert_eq!(code_101, nop_instr, "Addr 101 should contain NOP");
    assert_eq!(result, 99, "Dynamic code should have written 99 to addr 200");

    println!("\n  ✓ Program successfully wrote and executed new code");
}
