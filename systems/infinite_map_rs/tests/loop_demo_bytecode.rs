//! Test loop demo bytecode from Spatial ASCII compiler

use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};

#[test]
fn test_loop_demo_bytecode() {
    let mut vram = SyntheticVram::new_small(256);

    // Write loop demo bytecode from compiler output
    // Expected: loop 10 times, increment accumulator each time
    let program = vec![
        0xCC00000A, // LDI r0, 10 (opcode 204 << 24 | r0 << 16 | 10)
        0xCC010000, // LDI r1, 0
        0x05010100, // ADD r1, r1, r1 (opcode 5 << 24 | r1 << 16 | r1 << 8)
        0x06000000, // SUB r0, r0, 1 (opcode 6 << 24 | r0 << 16 | r0 << 8)
        0x0A008006, // JZ r0, 0x8006 (opcode 10 << 24 | r0 << 16 | 0x8006)
        0xD1008002, // JMP 0x8002 (opcode 209 << 24 | 0x8002)
        0x0D000000, // HALT (opcode 13 << 24)
    ];

    // Write program to 0x8000
    for (i, &instr) in program.iter().enumerate() {
        vram.poke(0x8000 + i as u32, instr);
    }

    // Spawn VM
    let mut config = SyntheticVmConfig::default();
    config.entry_point = 0x8000;
    vram.spawn_vm(0, &config).unwrap();

    // Execute until halt
    let mut cycles = 0;
    while !vram.is_halted(0) && cycles < 100 {
        vram.step(0);
        cycles += 1;
    }

    // Check result
    let vm = vram.vm_state(0).unwrap();
    println!("Loop Demo Test Results:");
    println!("  Cycles: {}", cycles);
    println!("  Final r0 (counter): {}", vm.regs[0]);
    println!("  Final r1 (accumulator): {}", vm.regs[1]);
    println!("  Final PC: 0x{:04X}", vm.pc);
    println!("  Halted: {}", vram.is_halted(0));

    assert!(vram.is_halted(0), "VM should be halted");
    assert_eq!(vm.regs[0], 0, "r0 should be 0 (counter exhausted)");
    assert_eq!(vm.regs[1], 10, "r1 should be 10 (loop executed 10 times)");
}
