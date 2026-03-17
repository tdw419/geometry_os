//! Full Assembler with Multi-Digit Numbers
//!
//! Proves the assembler can parse arbitrary-length numbers like "50000"
//! using the accumulation loop (val = val * 10 + digit).
//!
//! Input:  "LDI r3, 50000\nHALT"
//! Output: [LDI r3 opcode] [50000] [HALT opcode]

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
                label: Some("Full Assembler Multi-Digit Test"),
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
    fn test_full_assembler_multidigit() {
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
            label: Some("Assembler RAM"),
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

        println!("\n=== FULL ASSEMBLER MULTI-DIGIT TEST ===");

        // Input: "LDI r3, 50000\nHALT" at address 10000
        let input = b"LDI r3, 50000\nHALT";
        for (i, &b) in input.iter().enumerate() {
            scheduler.poke_substrate_single(10000 + i as u32, b as u32);
        }
        scheduler.poke_substrate_single(10000 + input.len() as u32, 0);
        println!("Input: {:?}", std::str::from_utf8(input).unwrap());

        // Atlas templates at address 50000
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0));  // LDI template
        scheduler.poke_substrate_single(50001, glyph(13, 0, 0, 0)); // HALT template
        println!("Atlas: LDI template at 50000, HALT template at 50001");

        // ========================================
        // THE FULL ASSEMBLER WITH MULTI-DIGIT
        // ========================================
        //
        // Register map:
        //   r0  = text_ptr
        //   r1  = current_char
        //   r2  = temp
        //   r3  = emit_ptr
        //   r4  = atlas_ptr (for templates)
        //   r5  = template value
        //   r6  = register number / digit accumulator
        //   r7  = temp for shifts
        //   r8  = constant '0' (48)
        //   r9  = constant 10
        //   r10 = constant 1
        //   r11 = temp
        //   r12 = ' ' (32)
        //   r13 = '\n' (10)
        //   r14 = 'r' (114)
        //   r15 = ',' (44)

        let mut b = ProgramBuilder::new();

        // Init constants (match original test)
        b.ldi(0, 10000);  // text_ptr
        b.ldi(3, 200);    // emit_ptr
        b.ldi(9, 10);     // multiplier
        b.ldi(10, 1);     // increment
        b.ldi(11, 48);    // '0' (used for digit conversion)
        b.ldi(12, 32);    // ' '
        b.ldi(13, 10);    // '\n'
        b.ldi(14, 114);   // 'r'
        b.ldi(15, 44);    // ','

        // Main loop
        b.label("main_loop");
        b.load(0, 1);     // r1 = char

        // Skip whitespace
        b.beq(1, 12, "skip_ws");  // ' '
        b.beq(1, 13, "skip_ws");  // '\n'
        b.jmp("try_ldi");

        b.label("skip_ws");
        b.add(10, 0);     // text_ptr++
        b.jmp("main_loop");

        // Try LDI
        b.label("try_ldi");
        b.ldi(2, 76);     // 'L'
        b.bne(1, 2, "try_halt");
        b.add(10, 0); b.load(0, 1);  // 'D'
        b.ldi(2, 68); b.bne(1, 2, "error");
        b.add(10, 0); b.load(0, 1);  // 'I'
        b.ldi(2, 73); b.bne(1, 2, "error");

        // LDI matched! Parse register
        b.label("ldi_skip_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "ldi_skip_ws1");  // skip spaces
        b.beq(1, 15, "ldi_skip_ws1");  // skip commas

        // Expect 'r'
        b.bne(1, 14, "error");  // must be 'r'

        // Debug: store 'r' found marker at addr 300
        b.ldi(2, 1); b.ldi(7, 300); b.store(7, 2);

        b.add(10, 0); b.load(0, 1);  // digit

        // Debug: store digit char at addr 301
        b.ldi(7, 301); b.store(7, 1);

        // r6 = digit - 48 (register number) - match original test exactly
        b.mov(11, 6); b.sub(1, 6);  // r6 = r1 - r11 = char - 48

        // Debug: store r6 (register number) at addr 302 using r2
        b.mov(6, 2); b.ldi(7, 302); b.store(7, 2); b.mov(2, 6);  // restore r6

        // Debug: store r3 (emit_ptr) at addr 303 using r2
        b.mov(3, 2); b.ldi(7, 303); b.store(7, 2); b.mov(2, 3);  // restore r3

        // Emit LDI opcode from template (match original test exactly)
        b.ldi(4, 50000); b.load(4, 5);  // r5 = template from atlas

        // Debug: store r5 (template) at addr 304 using r2
        b.mov(5, 2); b.ldi(7, 304); b.store(7, 2); b.mov(2, 5);  // restore r5

        b.ldi(7, 16); b.shl(6, 7);      // r7 = reg << 16

        // Debug: store r7 (shifted) at addr 305 using r2
        b.mov(7, 2); b.ldi(7, 305); b.store(7, 2);

        // Now r7 = 305, need to restore shifted value
        b.ldi(7, 16); b.shl(6, 7);      // r7 = reg << 16 (recompute)

        b.or(5, 7);      // r7 = template | shifted

        // Debug: store r7 (opcode) at addr 306 using r2
        b.mov(7, 2); b.ldi(7, 306); b.store(7, 2);

        // Recompute opcode
        b.ldi(7, 16); b.shl(6, 7); b.or(5, 7);

        b.store(3, 7);      // mem[emit_ptr] = opcode
        b.add(10, 3);                    // emit_ptr++

        // Debug: store LDI done marker at addr 307
        b.ldi(2, 7); b.ldi(7, 307); b.store(7, 2);

        // Skip to number (skip comma, spaces)
        b.label("ldi_skip_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "ldi_skip_ws2");
        b.beq(1, 15, "ldi_skip_ws2");

        // Multi-digit number accumulation
        // r6 = accumulator (starts at 0)
        b.ldi(6, 0);      // acc = 0

        b.label("num_loop");
        // Check if char is digit
        b.ldi(2, 48);     // '0'
        b.blt(1, 2, "num_done");  // if char < '0', done
        b.ldi(2, 58);     // '9' + 1
        b.bgeu(1, 2, "num_done");  // if char >= ':', done

        // digit = char - 48 (use r7 as temp, copy from r11)
        b.mov(11, 7);     // r7 = 48
        b.sub(1, 7);      // r7 = digit

        // acc = acc * 10 + digit
        b.mul(9, 6);      // r6 = acc * 10
        b.add(7, 6);      // r6 = acc * 10 + digit

        // Next char
        b.add(10, 0);     // text_ptr++
        b.load(0, 1);     // r1 = next char
        b.jmp("num_loop");

        b.label("num_done");
        // r6 = accumulated number (50000)
        b.store(3, 6);    // emit number
        b.add(10, 3);     // emit_ptr++
        b.add(10, 0);     // text_ptr++ (skip last digit)
        b.jmp("main_loop");

        // Try HALT
        b.label("try_halt");
        b.ldi(2, 72);     // 'H'
        b.bne(1, 2, "check_end");
        b.add(10, 0); b.load(0, 1);  // 'A'
        b.ldi(2, 65); b.bne(1, 2, "error");
        b.add(10, 0); b.load(0, 1);  // 'L'
        b.ldi(2, 76); b.bne(1, 2, "error");
        b.add(10, 0); b.load(0, 1);  // 'T'
        b.ldi(2, 84); b.bne(1, 2, "error");

        // Emit HALT
        b.ldi(4, 50001);  // atlas: HALT template
        b.load(4, 5);
        b.store(3, 5);
        b.add(10, 3);
        b.jmp("main_loop");

        b.label("check_end");
        b.ldi(2, 0);
        b.beq(1, 2, "done");

        b.label("error");
        b.halt();

        b.label("done");
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
        println!("Executing assembler...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Verify output
        let r200 = scheduler.peek_substrate_single(200);
        let r201 = scheduler.peek_substrate_single(201);
        let r202 = scheduler.peek_substrate_single(202);

        // Debug values
        let r300 = scheduler.peek_substrate_single(300);
        let r301 = scheduler.peek_substrate_single(301);
        let r302 = scheduler.peek_substrate_single(302);
        let r303 = scheduler.peek_substrate_single(303);
        let r304 = scheduler.peek_substrate_single(304);
        let r305 = scheduler.peek_substrate_single(305);
        let r306 = scheduler.peek_substrate_single(306);
        let r307 = scheduler.peek_substrate_single(307);

        println!("\n=== DEBUG ===");
        println!("  addr 300 (found 'r' marker): {}", r300);
        println!("  addr 301 (digit char): {} ('{}')", r301, if r301 >= 32 && r301 < 127 { r301 as u8 as char } else { '?' });
        println!("  addr 302 (r6 register number): {}", r302);
        println!("  addr 303 (r3 emit_ptr before store): {}", r303);
        println!("  addr 304 (r5 template from atlas): 0x{:08X}", r304);
        println!("  addr 305 (r7 shifted reg): 0x{:08X}", r305);
        println!("  addr 306 (r7 final opcode): 0x{:08X}", r306);
        println!("  addr 307 (LDI done marker): {}", r307);

        println!("\n=== VERIFICATION ===");
        println!("  addr 200: expected 0x00030001 (LDI r3), got 0x{:08X}", r200);
        println!("  addr 201: expected 0x0000C350 (50000), got 0x{:08X}", r201);
        println!("  addr 202: expected 0x0000000D (HALT), got 0x{:08X}", r202);

        let expected_ldi = glyph(1, 0, 3, 0);
        let expected_halt = glyph(13, 0, 0, 0);

        if r200 == expected_ldi && r201 == 50000 && r202 == expected_halt {
            println!("\n  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  FULL ASSEMBLER WITH MULTI-DIGIT WORKS!              ║");
            println!("  ║  GPU compiled \"LDI r3, 50000\\nHALT\" → opcodes.       ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("\n  FAILED:");
            println!("    LDI: expected 0x{:08X}, got 0x{:08X}", expected_ldi, r200);
            println!("    NUM: expected 50000, got {}", r201);
            println!("    HALT: expected 0x{:08X}, got 0x{:08X}", expected_halt, r202);
        }

        assert_eq!(r200, expected_ldi, "LDI opcode mismatch");
        assert_eq!(r201, 50000, "Number mismatch");
        assert_eq!(r202, expected_halt, "HALT opcode mismatch");
    }

    // ProgramBuilder (same as other tests)
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

        fn or(&mut self, rs1: u8, rs2: u8) {
            self.ins(glyph(8, 0, rs1, rs2));
        }

        fn shl(&mut self, rs1: u8, rs2: u8) {
            self.ins(glyph(131, 0, rs1, rs2));
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
            self.branch(2, r1, r2, target);
        }

        fn bgeu(&mut self, r1: u8, r2: u8, target: &str) {
            self.branch(5, r1, r2, target);
        }

        fn jmp(&mut self, target: &str) {
            self.beq(10, 10, target);
        }
    }
}
