//! Full Assembler Loop Test
//!
//! Milestone: FULL ASSEMBLER LOOP
//!
//! Proves that a glyph program can parse multiple lines of ASCII text
//! and emit a complete executable program.
//!
//! Text Buffer: "LDI r3, 42\nHALT"
//! Compiled output at addr 200: (1,0,3,0) 42 (13,0,0,0)

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
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
                label: Some("Full Assembler Test"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;
        Some((Arc::new(device), Arc::new(queue)))
    }

    fn setup_scheduler(
        device: &Arc<wgpu::Device>,
        queue: &Arc<wgpu::Queue>,
    ) -> infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler {
        use infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler;
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler =
            GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram);
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Assembler RAM"),
            size: wgpu::Extent3d {
                width: 4096, height: 4096, depth_or_array_layers: 1,
            },
            mip_level_count: 1, sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING
                | wgpu::TextureUsages::COPY_DST
                | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);
        scheduler
    }

    /// Glyph program builder with label-based branching.
    /// Eliminates manual offset calculation.
    struct ProgramBuilder {
        pixels: Vec<(u32, u32)>,
        addr: u32,
        /// label name → address
        labels: std::collections::HashMap<String, u32>,
        /// (pixel_index, label_name) for fixups
        fixups: Vec<(usize, String)>,
    }

    impl ProgramBuilder {
        fn new(start: u32) -> Self {
            Self {
                pixels: Vec::new(),
                addr: start,
                labels: std::collections::HashMap::new(),
                fixups: Vec::new(),
            }
        }

        /// Place a label at the current address
        fn label(&mut self, name: &str) {
            self.labels.insert(name.to_string(), self.addr);
        }

        /// Emit a single pixel
        fn emit(&mut self, val: u32) {
            self.pixels.push((self.addr, val));
            self.addr += 1;
        }

        /// Emit a glyph instruction
        fn inst(&mut self, opcode: u8, stratum: u8, p1: u8, p2: u8) {
            self.emit(glyph(opcode, stratum, p1, p2));
        }

        /// LDI r[reg] = imm32 (2 pixels)
        fn ldi(&mut self, reg: u8, val: u32) {
            self.inst(1, 0, reg, 0);
            self.emit(val);
        }

        /// LOAD r[dst] = mem[r[src]]
        fn load(&mut self, src: u8, dst: u8) {
            self.inst(3, 0, src, dst);
        }

        /// STORE mem[r[addr_reg]] = r[val_reg]
        fn store(&mut self, addr_reg: u8, val_reg: u8) {
            self.inst(4, 0, addr_reg, val_reg);
        }

        /// ADD r[p2] = r[p1] + r[p2]
        fn add(&mut self, p1: u8, p2: u8) {
            self.inst(5, 0, p1, p2);
        }

        /// SUB r[p2] = r[p1] - r[p2]
        fn sub(&mut self, p1: u8, p2: u8) {
            self.inst(6, 0, p1, p2);
        }

        /// MUL r[p2] = r[p1] * r[p2]
        fn mul(&mut self, p1: u8, p2: u8) {
            self.inst(7, 0, p1, p2);
        }

        /// MOV r[p2] = r[p1]
        fn mov(&mut self, src: u8, dst: u8) {
            self.inst(2, 0, src, dst);
        }

        /// SHL r[p2] = r[p1] << r[p2]
        fn shl(&mut self, p1: u8, p2: u8) {
            self.inst(131, 0, p1, p2);
        }

        /// OR r[p2] = r[p1] | r[p2]
        fn or(&mut self, p1: u8, p2: u8) {
            self.inst(129, 0, p1, p2);
        }

        /// HALT
        fn halt(&mut self) {
            self.inst(13, 0, 0, 0);
        }

        /// BEQ r[p1], r[p2] → label (2 pixels)
        fn beq(&mut self, p1: u8, p2: u8, label: &str) {
            let branch_pc = self.addr;
            self.inst(10, 0, p1, p2);
            // offset placeholder — will be fixed up
            let idx = self.pixels.len();
            self.emit(0); // placeholder
            self.fixups.push((idx, label.to_string()));
        }

        /// BNE r[p1], r[p2] → label (2 pixels)
        fn bne(&mut self, p1: u8, p2: u8, label: &str) {
            let branch_pc = self.addr;
            self.inst(10, 1, p1, p2);
            let idx = self.pixels.len();
            self.emit(0);
            self.fixups.push((idx, label.to_string()));
        }

        /// Unconditional jump to label (BEQ r10, r10 — always true since r10==r10)
        fn jmp(&mut self, label: &str) {
            self.beq(10, 10, label);
        }

        /// Skip to a specific address (leave gap)
        fn skip_to(&mut self, target: u32) {
            self.addr = target;
        }

        /// Resolve all branch fixups and return the program
        fn build(mut self) -> Vec<(u32, u32)> {
            for (pixel_idx, label_name) in &self.fixups {
                let target_addr = *self.labels.get(label_name)
                    .unwrap_or_else(|| panic!("Unknown label: {}", label_name));
                // The branch instruction is at pixels[pixel_idx - 1]
                // Its address is pixels[pixel_idx - 1].0
                let branch_addr = self.pixels[pixel_idx - 1].0;
                // offset = target - (branch_addr + 2)
                let offset = target_addr as i32 - branch_addr as i32 - 2;
                self.pixels[*pixel_idx].1 = offset as u32;
            }
            self.pixels
        }
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_full_assembler_loop() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => { println!("SKIP: No GPU"); return; }
        };

        use infinite_map_rs::glyph_vm_scheduler::VmConfig;
        let mut scheduler = setup_scheduler(&device, &queue);

        println!("\n=== MILESTONE: FULL ASSEMBLER LOOP ===");

        // --- Text Buffer at addr 10000: "LDI r3, 42\nHALT\0" ---
        let text = "LDI r3, 42\nHALT";
        println!("Text: '{}'", text.replace('\n', "\\n"));
        for (i, c) in text.bytes().enumerate() {
            scheduler.poke_substrate_single(10000 + i as u32, c as u32);
        }
        scheduler.poke_substrate_single(10000 + text.len() as u32, 0); // null terminator

        // --- Atlas at 50000 ---
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0));  // LDI template
        scheduler.poke_substrate_single(50001, glyph(13, 0, 0, 0)); // HALT template

        // --- Build the assembler program ---
        // Register assignments:
        //   r0  = text_ptr (input cursor)
        //   r1  = current_char
        //   r2  = temp / expected char
        //   r3  = emit_ptr (output cursor, starts at 200)
        //   r4  = atlas_ptr
        //   r5  = loaded template
        //   r6  = scratch
        //   r7  = scratch2
        //   r10 = constant 1
        //   r11 = constant 48 ('0')
        //   r12 = constant 32 (' ')
        //   r13 = constant 10 ('\n')
        //   r14 = constant 114 ('r')
        //   r15 = constant 44 (',')
        //   r16 = constant 0 (null)
        //   r17 = constant 16 (for shift)

        let mut b = ProgramBuilder::new(0);

        // --- INIT ---
        b.ldi(0, 10000);   // r0 = text_ptr
        b.ldi(3, 200);     // r3 = emit_ptr
        b.ldi(10, 1);      // r10 = 1
        b.ldi(11, 48);     // r11 = '0'
        b.ldi(12, 32);     // r12 = ' '
        b.ldi(13, 10);     // r13 = '\n'
        b.ldi(14, 114);    // r14 = 'r'
        b.ldi(15, 44);     // r15 = ','
        b.ldi(16, 0);      // r16 = null terminator
        b.ldi(17, 16);     // r17 = 16 (for SHL)

        // --- MAIN LOOP: skip whitespace, dispatch mnemonic ---
        b.label("main_loop");
        b.load(0, 1);                 // r1 = mem[r0] (read char)
        b.beq(1, 16, "done");         // if null terminator, done
        b.beq(1, 12, "skip_ws");      // if space, skip
        b.beq(1, 13, "skip_ws");      // if newline, skip
        b.jmp("match_mnemonic");       // else try matching

        b.label("skip_ws");
        b.add(10, 0);                 // r0++ (advance text ptr)
        b.jmp("main_loop");

        // --- MNEMONIC DISPATCH ---
        b.label("match_mnemonic");
        b.ldi(2, 76);                 // r2 = 'L'
        b.beq(1, 2, "try_ldi");       // if 'L', try LDI
        b.ldi(2, 72);                 // r2 = 'H'
        b.beq(1, 2, "try_halt");      // if 'H', try HALT
        b.jmp("error");               // unknown mnemonic

        // --- TRY LDI: match 'D', 'I' ---
        b.label("try_ldi");
        b.add(10, 0);                 // r0++ (past 'L')
        b.load(0, 1);                 // r1 = next char
        b.ldi(2, 68);                 // r2 = 'D'
        b.bne(1, 2, "error");         // if not 'D', error
        b.add(10, 0);                 // r0++ (past 'D')
        b.load(0, 1);                 // r1 = next char
        b.ldi(2, 73);                 // r2 = 'I'
        b.bne(1, 2, "error");         // if not 'I', error
        b.add(10, 0);                 // r0++ (past 'I')

        // --- PARSE REGISTER: skip whitespace, match 'r', parse digit ---
        b.label("skip_ws_reg");
        b.load(0, 1);                 // r1 = char
        b.beq(1, 12, "skip_ws_reg2"); // if space, skip
        b.jmp("match_r");
        b.label("skip_ws_reg2");
        b.add(10, 0);                 // r0++
        b.jmp("skip_ws_reg");

        b.label("match_r");
        b.bne(1, 14, "error");        // if not 'r', error
        b.add(10, 0);                 // r0++ (past 'r')
        b.load(0, 1);                 // r1 = digit char (e.g. '3' = 51)
        // r1 = char - '0': need r6 = r1, then r6 = r1 - r11
        // SUB r[p2] = r[p1] - r[p2], so sub(1, 6) → r6 = r1 - r6
        // First copy r11 to r6, then sub
        b.mov(11, 6);                 // r6 = r11 = 48
        b.sub(1, 6);                  // r6 = r1 - r6 = char - 48 = register number
        b.add(10, 0);                 // r0++ (past digit)

        // --- EMIT LDI OPCODE: template | (reg << 16) ---
        b.ldi(4, 50000);              // r4 = atlas addr of LDI
        b.load(4, 5);                 // r5 = LDI template = (1,0,0,0)
        b.mov(17, 7);                 // r7 = 16 (shift amount)
        b.shl(6, 7);                  // r7 = r6 << r7 = reg << 16
        b.or(5, 7);                   // r7 = r5 | r7 = patched instruction
        b.store(3, 7);                // mem[r3] = patched LDI opcode
        b.add(10, 3);                 // r3++ (emit_ptr)

        // --- PARSE IMMEDIATE: skip comma/whitespace, parse digits ---
        b.label("skip_comma");
        b.load(0, 1);                 // r1 = char
        b.beq(1, 12, "skip_comma2");  // space → skip
        b.beq(1, 15, "skip_comma2");  // comma → skip
        b.jmp("parse_digits");
        b.label("skip_comma2");
        b.add(10, 0);                 // r0++
        b.jmp("skip_comma");

        // --- PARSE MULTI-DIGIT NUMBER ---
        // r6 = accumulated value, start at 0
        b.label("parse_digits");
        b.ldi(6, 0);                  // r6 = 0 (accumulator)

        b.label("digit_loop");
        b.load(0, 1);                 // r1 = char
        // check if digit: char >= '0' (48) and char <= '9' (57)
        // simplified: check if char == newline, null, space, or comma → stop
        b.beq(1, 13, "emit_imm");     // newline → done
        b.beq(1, 16, "emit_imm");     // null → done
        b.beq(1, 12, "emit_imm");     // space → done
        b.beq(1, 15, "emit_imm");     // comma → done

        // r6 = r6 * 10 + (r1 - 48)
        b.ldi(7, 10);                 // r7 = 10
        b.mul(7, 6);                  // r6 = r7 * r6 = accumulator * 10
        b.mov(11, 7);                 // r7 = 48
        b.sub(1, 7);                  // r7 = r1 - r7 = digit value
        b.add(7, 6);                  // r6 = r6 + r7 = accumulated
        b.add(10, 0);                 // r0++
        b.jmp("digit_loop");

        b.label("emit_imm");
        b.store(3, 6);                // mem[r3] = immediate value
        b.add(10, 3);                 // r3++
        b.jmp("main_loop");           // back to top for next instruction

        // --- TRY HALT: match 'A', 'L', 'T' ---
        b.label("try_halt");
        b.add(10, 0);                 // r0++ (past 'H')
        b.load(0, 1);
        b.ldi(2, 65);                 // 'A'
        b.bne(1, 2, "error");
        b.add(10, 0);                 // r0++ (past 'A')
        b.load(0, 1);
        b.ldi(2, 76);                 // 'L'
        b.bne(1, 2, "error");
        b.add(10, 0);                 // r0++ (past 'L')
        b.load(0, 1);
        b.ldi(2, 84);                 // 'T'
        b.bne(1, 2, "error");
        b.add(10, 0);                 // r0++ (past 'T')

        // EMIT HALT
        b.ldi(4, 50001);              // atlas addr of HALT
        b.load(4, 5);                 // r5 = HALT template
        b.store(3, 5);                // mem[r3] = HALT
        b.add(10, 3);                 // r3++
        b.jmp("main_loop");           // continue (will hit null or newline)

        // --- DONE / ERROR ---
        b.label("done");
        b.halt();

        b.label("error");
        b.halt();

        let program = b.build();

        println!("Assembler program: {} pixels (addr 0-{})",
            program.len(), program.last().map(|p| p.0).unwrap_or(0));
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // --- Execute ---
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("Failed to spawn VM");
        println!("Executing...");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // --- Verify ---
        let addr_200 = scheduler.peek_substrate_single(200);
        let addr_201 = scheduler.peek_substrate_single(201);
        let addr_202 = scheduler.peek_substrate_single(202);

        let expected_ldi = glyph(1, 0, 3, 0);
        let expected_data = 42u32;
        let expected_halt = glyph(13, 0, 0, 0);

        println!("\n=== VERIFICATION ===\n");
        let s = |a: u32, e: u32| if a == e { "✓" } else { "✗" };
        println!("  {} addr 200: expected 0x{:08X} (LDI r3),  got 0x{:08X}",
            s(addr_200, expected_ldi), expected_ldi, addr_200);
        println!("  {} addr 201: expected 0x{:08X} (DATA 42), got 0x{:08X}",
            s(addr_201, expected_data), expected_data, addr_201);
        println!("  {} addr 202: expected 0x{:08X} (HALT),    got 0x{:08X}",
            s(addr_202, expected_halt), expected_halt, addr_202);

        let success = addr_200 == expected_ldi
            && addr_201 == expected_data
            && addr_202 == expected_halt;

        println!();
        if success {
            println!("  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  FULL ASSEMBLER LOOP WORKS.                          ║");
            println!("  ║                                                       ║");
            println!("  ║  GPU parsed \"LDI r3, 42\\nHALT\" from text buffer.     ║");
            println!("  ║  Matched mnemonics, parsed register + immediate.     ║");
            println!("  ║  Emitted 3 pixels: LDI r3 / 42 / HALT               ║");
            println!("  ║                                                       ║");
            println!("  ║  Text → GPU assembler → executable program.          ║");
            println!("  ║  No CPU involved in compilation.                     ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("  FAILED.");
            // Debug: dump nearby addresses
            println!("\n  Debug dump:");
            for i in 195..210 {
                let v = scheduler.peek_substrate_single(i);
                if v != 0 {
                    println!("    addr {}: 0x{:08X}", i, v);
                }
            }
        }
        println!();

        assert!(success, "Full assembler loop failed");
    }
}
