//! Multi-Digit Accumulation Test
//!
//! ROOT CAUSE TEST: Proves that the GPU can accumulate multi-digit numbers
//! using a loop (val = val * 10 + digit).
//!
//! This is the missing piece for parsing "50000" instead of "50".

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::default(),
            compatible_surface: None,
            force_fallback_adapter: false,
        }))?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Multi-Digit Accumulation Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_multi_digit_accumulation_loop() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => {
                println!("SKIP: No GPU available");
                return;
            }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Accumulation Test RAM"),
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

        println!("\n=== MULTI-DIGIT ACCUMULATION TEST ===");

        // Text buffer: "50000" at address 10000
        let digits = b"50000";
        for (i, &d) in digits.iter().enumerate() {
            scheduler.poke_substrate_single(10000 + i as u32, d as u32);
        }
        // Null terminator
        scheduler.poke_substrate_single(10000 + digits.len() as u32, 0);
        println!("Input: \"50000\" at address 10000");

        // ========================================
        // THE ACCUMULATION LOOP PROGRAM
        // ========================================
        //
        // Register map:
        //   r0  = text_ptr (10000)
        //   r1  = current_char
        //   r2  = temp / digit
        //   r3  = constant 48 ('0')
        //   r4  = constant 10
        //   r5  = constant '0' (48) for comparison
        //   r6  = constant '9' (57) for comparison
        //   r7  = accumulator
        //   r8  = output address (200)
        //   r10 = constant 1 (increment)
        //   r11 = temp for MUL result
        //
        // Loop:
        //   LOAD r1 = mem[r0]
        //   if r1 == 0: goto done
        //   if r1 < '0': goto done
        //   if r1 > '9': goto done
        //   r2 = r1 - 48  (digit value)
        //   r11 = r7 * 10
        //   r7 = r11 + r2  (acc = acc*10 + digit)
        //   r0 += 1
        //   goto loop
        // done:
        //   STORE [r8] = r7
        //   HALT

        let program: Vec<(u32, u32)> = vec![
            // === INIT CONSTANTS ===
            (0, glyph(1, 0, 0, 0)),   // LDI r0
            (1, 10000),                // r0 = 10000 (text_ptr)

            (2, glyph(1, 0, 3, 0)),   // LDI r3
            (3, 48),                   // r3 = 48 ('0')

            (4, glyph(1, 0, 4, 0)),   // LDI r4
            (5, 10),                   // r4 = 10

            (6, glyph(1, 0, 5, 0)),   // LDI r5
            (7, 48),                   // r5 = '0' (48) for comparison

            (8, glyph(1, 0, 6, 0)),   // LDI r6
            (9, 57),                   // r6 = '9' (57) for comparison

            (10, glyph(1, 0, 7, 0)),  // LDI r7
            (11, 0),                   // r7 = 0 (accumulator)

            (12, glyph(1, 0, 8, 0)),  // LDI r8
            (13, 200),                 // r8 = 200 (output address)

            (14, glyph(1, 0, 10, 0)), // LDI r10
            (15, 1),                   // r10 = 1 (increment)

            // === MAIN LOOP (starts at addr 16) ===
            (16, glyph(3, 0, 0, 1)),  // LOAD r1 = mem[r0]

            // Check for null terminator
            (17, glyph(1, 0, 2, 0)),  // LDI r2
            (18, 0),                   // r2 = 0
            (19, glyph(10, 0, 1, 2)), // BEQ r1, r2 -> done
            (20, 20i32 as u32),        // offset to addr 40 (done)

            // Check r1 < '0' (48): if r1 < r5, done
            (21, glyph(10, 4, 1, 5)), // BLTU r1, r5 -> done (if r1 < 48)
            (22, 18i32 as u32),        // offset to addr 40

            // Check r1 > '9' (57): if r1 > r6, done
            (23, glyph(10, 5, 1, 6)), // BGEU r1, r6 -> done (if r1 >= 58, i.e. > 57)
            (24, 16i32 as u32),        // offset to addr 40

            // r2 = r1 - r3 (digit = char - 48)
            // SUB: r[p2] = r[p1] - r[p2]
            // We want r2 = r1 - r3, so p1=1, p2=3 → r3 = r1 - r3
            // Then move r3 back to r2
            (25, glyph(6, 0, 1, 2)),  // SUB r2 = r1 - r2 (but r2 is 0 from earlier... need to reload r3)

            // Actually, let's use a different approach:
            // Move r1 to r2 first, then subtract r3
            (25, glyph(2, 0, 1, 2)),  // MOV r2 = r1
            (26, glyph(6, 0, 3, 2)),  // SUB r2 = r3 - r2... no that's wrong too

            // Let me reload r3 since we overwrote it... wait, r3 should still be 48
            // Actually the issue is SUB: r[p2] = r[p1] - r[p2]
            // To do r2 = r2 - r3, we need p1=2, p2=3, which gives r3 = r2 - r3
            // Then we need to move result back

            // Simpler: use r9 as scratch for digit
            // r9 = r1 - r3
            (25, glyph(2, 0, 1, 9)),  // MOV r9 = r1
            (26, glyph(6, 0, 3, 9)),  // SUB r9 = r3 - r9... no, still wrong

            // The SUB is r[p2] = r[p1] - r[p2]
            // So to get r9 = r1 - r3:
            // We need r9 in p2 position, r1 in p1 position
            // glyph(6, 0, 1, 9) → r9 = r1 - r9 (but r9 might not be 0)

            // Let's zero r9 first, then MOV r1→r9, then subtract
            (25, glyph(1, 0, 9, 0)),  // LDI r9
            (26, 0),                   // r9 = 0
            (27, glyph(5, 0, 1, 9)),  // ADD r9 = r1 + r9 = r1
            (28, glyph(6, 0, 3, 9)),  // SUB r9 = r3 - r9 = 48 - r1... WRONG

            // OK the SUB operand order is confusing. Let me check:
            // r[p2] = r[p1] - r[p2]
            // If we want result = r1 - r3:
            // We need r1 in p1, r3 in p2, result in... r3 (p2 position)
            // So glyph(6, 0, 1, 3) gives r3 = r1 - r3
            // Then we can use r3 as the digit value

            // Let me restart the program with this understanding
        ];

        // The program is getting complex. Let me write a cleaner version using ProgramBuilder.
        // Actually, let me first verify the SUB instruction works as expected.

        // Simpler approach: test just the core accumulation in isolation
        // Test: r7 = 0, r7 = r7*10 + 5, r7 = r7*10 + 0, ... = 50000

        println!("Program too complex for manual encoding. Using ProgramBuilder...");

        // Use the ProgramBuilder pattern from full_assembler_test
        let mut b = ProgramBuilder::new();

        // Init
        b.ldi(0, 10000);  // r0 = text_ptr
        b.ldi(3, 48);     // r3 = '0'
        b.ldi(4, 10);     // r4 = 10
        b.ldi(7, 0);      // r7 = accumulator
        b.ldi(8, 200);    // r8 = output addr
        b.ldi(10, 1);     // r10 = 1

        // Loop
        b.label("loop");
        b.load(0, 1);     // r1 = char

        // Check null
        b.ldi(2, 0);
        b.beq(1, 2, "done");

        // Check < '0'
        b.ldi(5, 48);
        b.blt(1, 5, "done");  // if r1 < 48, done

        // Check > '9'
        b.ldi(6, 58);     // 57+1 for BGE
        b.bgeu(1, 6, "done");  // if r1 >= 58, done (BLTU doesn't exist, use BGEU)

        // digit = char - 48
        // Reload r3 = 48 (it gets overwritten by SUB result)
        b.ldi(3, 48);
        // SUB: r[p2] = r[p1] - r[p2]
        // sub(1, 3) → r3 = r1 - r3 = char - 48 = digit ✓
        b.sub(1, 3);

        // Now accumulate: r7 = r7 * 10 + r3
        // MUL: r[p2] = r[p1] * r[p2]
        // mul(4, 7) → r7 = r4 * r7 = 10 * acc
        b.mul(4, 7);       // r7 = r4 * r7 = 10 * acc

        // ADD: r7 = r3 + r7
        b.add(3, 7);       // r7 = r3 + r7 = digit + acc*10

        // Increment pointer
        b.add(10, 0);      // r0 += r10

        // Loop
        b.jmp("loop");

        // Done
        b.label("done");
        b.store(8, 7);     // mem[r8] = r7
        b.halt();

        let program = b.build();
        println!("Program size: {} pixels", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // Execute
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        println!("Executing accumulation loop...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Verify
        let result = scheduler.peek_substrate_single(200);
        let expected = 50000u32;

        println!("\n=== VERIFICATION ===");
        println!("  Expected: {}", expected);
        println!("  Got:      {}", result);

        if result == expected {
            println!("  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  MULTI-DIGIT ACCUMULATION WORKS.                     ║");
            println!("  ║  GPU correctly parsed \"50000\" → 50000.               ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("  FAILED: Expected {}, got {}", expected, result);
        }

        assert_eq!(result, expected, "Multi-digit accumulation failed");
    }

    // Minimal ProgramBuilder
    struct ProgramBuilder {
        instructions: Vec<(u32, u32)>,
        labels: std::collections::HashMap<String, u32>,
        fixups: Vec<(u32, String)>,
        current_addr: u32,
    }

    impl ProgramBuilder {
        fn new() -> Self {
            Self {
                instructions: Vec::new(),
                labels: std::collections::HashMap::new(),
                fixups: Vec::new(),
                current_addr: 0,
            }
        }

        fn label(&mut self, name: &str) {
            self.labels.insert(name.to_string(), self.current_addr);
        }

        fn ins(&mut self, val: u32) {
            self.instructions.push((self.current_addr, val));
            self.current_addr += 1;
        }

        fn branch(&mut self, cond: u8, rs1: u8, rs2: u8, target: &str) {
            self.ins(glyph(10, cond, rs1, rs2));
            self.fixups.push((self.current_addr, target.to_string()));
            self.current_addr += 1;
        }

        fn build(mut self) -> Vec<(u32, u32)> {
            for (addr, target) in self.fixups {
                let target_addr = *self.labels.get(&target).expect(&format!("Missing label: {}", target));
                let offset = (target_addr as i32) - (addr as i32 + 1);
                self.instructions.push((addr, offset as u32));
            }
            self.instructions.sort_by_key(|(a, _)| *a);
            self.instructions
        }

        fn ldi(&mut self, reg: u8, val: u32) {
            self.ins(glyph(1, 0, reg, 0));
            self.ins(val);
        }

        fn load(&mut self, src_reg: u8, dst_reg: u8) {
            self.ins(glyph(3, 0, src_reg, dst_reg));
        }

        fn store(&mut self, addr_reg: u8, val_reg: u8) {
            self.ins(glyph(4, 0, addr_reg, val_reg));
        }

        fn add(&mut self, rs1: u8, rs2: u8) {
            self.ins(glyph(5, 0, rs1, rs2));
        }

        fn sub(&mut self, rs1: u8, rs2: u8) {
            self.ins(glyph(6, 0, rs1, rs2));
        }

        fn mul(&mut self, rs1: u8, rs2: u8) {
            self.ins(glyph(7, 0, rs1, rs2));
        }

        fn mov(&mut self, rs1: u8, rs2: u8) {
            self.ins(glyph(2, 0, rs1, rs2));
        }

        fn halt(&mut self) {
            self.ins(glyph(13, 0, 0, 0));
        }

        fn beq(&mut self, r1: u8, r2: u8, target: &str) {
            self.branch(0, r1, r2, target);
        }

        fn bne(&mut self, r1: u8, r2: u8, target: &str) {
            self.branch(1, r1, r2, target);
        }

        fn blt(&mut self, r1: u8, r2: u8, target: &str) {
            self.branch(2, r1, r2, target);  // signed less than
        }

        fn bgeu(&mut self, r1: u8, r2: u8, target: &str) {
            self.branch(5, r1, r2, target);  // unsigned greater-or-equal
        }

        fn jmp(&mut self, target: &str) {
            self.beq(10, 10, target);  // always true
        }
    }
}
