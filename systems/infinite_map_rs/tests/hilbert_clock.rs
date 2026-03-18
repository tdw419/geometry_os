#[cfg(test)]
use infinite_map_rs::synthetic_vram::SyntheticVram;

#[test]
fn test_hilbert_clock_simulation() {
    use infinite_map_rs::synthetic_vram::SyntheticVmConfig;

    let mut vram = SyntheticVram::new_small(1024);

    // Hand-crafted minimal clock loop (6 bytes)
    // LDI r0, 0 | HILBERT_D2XY r1, r0 | DRAW 0x69, r1, r2 | LDI r3, 1 | ADD r0, r3 | JMP 3
    let program: Vec<u8> = vec![
        0xFF, 0x2C, 0x00, 0x00, // LDI r0, 0
        0xFF, 0x71, 0x00, 0x00, // HILBERT_D2XY r1, r0
        0xFF, 0x61, 0x69, 0x80, // DRAW 0x69, r1, r2
        0xFF, 0x2C, 0x01, 0x00, // LDI r3, 1
        0xFF, 0x65, 0x00, 0x00, // ADD r0, r3
        0xFF, 0x7B, 0x00, 0x03, // JMP 3
    ];

    // Copy to VRAM at 0x8000
    for (i, &byte) in program.iter().enumerate() {
        vram.poke_glyph(
            0x8000 + i as u32,
            (byte >> 0) as u8,
            (byte >> 4) as u8,
            (byte >> 8) as u8,
            (byte >> 12) as u8,
        );
    }

    vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();

    println!("Simple clock loop executing from 0x8000...");

    for i in 0..50 {
        vram.execute_frame();

        if let Some(vm) = vram.vm_state(0) {
            if vm.halted != 0 {
                println!("Halting at cycle {}", i);
                break;
            }
            println!("Cycle {}: PC=0x{:04X}", i, vm.pc);
        }
    }
}
