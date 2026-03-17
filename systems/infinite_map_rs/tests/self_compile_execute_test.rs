//! Self-Compile-and-Execute Test
//!
//! The ultimate sovereignty test: The GPU compiles a program and then
//! immediately executes it,//!
//! Input:  "LDI r1, 42\nSTORE r2, r1\nHALT"
//! Output: mem[300] = 42
//!
//! This proves the full sovereignty chain:
//!   Text → Assembler → Opcodes → Execution → Result

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
                label: Some("Self-Compile-Execute Test"),
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
    fn test_self_compile_execute() {
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
            label: Some("Self-Compile-Execute RAM"),
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

        println!("\n=== SELF-COMPILE-AND-EXECUTE TEST ===");

        // Input: Fibonacci-like program that computes 5 + 3 = 8
        // LDI r1, 5    - load 5 into r1
        // LDI r2, 3    - load 3 into r2
        // ADD r2, r1   - r1 = r1 + r2 = 8
        // LDI r3, 300  - load address 300 into r3
        // STORE r3, r1 - store r1 (8) to [r3]
        // HALT
        let input = b"LDI r1, 5\nLDI r2, 3\nADD r2, r1\nLDI r3, 300\nSTORE r3, r1\nHALT";
        for (i, &b) in input.iter().enumerate() {
            scheduler.poke_substrate_single(10000 + i as u32, b as u32);
        }
        scheduler.poke_substrate_single(10000 + input.len() as u32, 0);
        println!("Input: {:?}", std::str::from_utf8(input).unwrap());

        // Initialize result address
        scheduler.poke_substrate_single(300, 0);

        // Atlas templates
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0));     // LDI template
        scheduler.poke_substrate_single(50001, glyph(4, 0, 0, 0));     // STORE template
        scheduler.poke_substrate_single(50002, glyph(5, 0, 0, 0));     // ADD template
        scheduler.poke_substrate_single(50003, glyph(13, 0, 0, 0));    // HALT template
        println!("Atlas: LDI at 50000, STORE at 50001, ADD at 50002, HALT at 50003");

        // Build assembler program (simplified - just handles LDI, STORE, HALT)
        let mut b = ProgramBuilder::new();

        // Constants
        b.ldi(0, 10000);  // text_ptr
        b.ldi(3, 200);    // emit_ptr
        b.ldi(9, 10);     // multiplier
        b.ldi(10, 1);     // increment
        b.ldi(11, 48);    // '0'
        b.ldi(12, 32);    // ' '
        b.ldi(13, 10);    // '\n'
        b.ldi(14, 114);   // 'r'
        b.ldi(15, 44);    // ','

        // Main loop - skip whitespace
        b.label("main_loop");
        b.load(0, 1);
        b.beq(1, 12, "skip_ws");
        b.beq(1, 13, "skip_ws");
        b.jmp("try_ldi");

        b.label("skip_ws");
        b.add(10, 0);
        b.jmp("main_loop");

        // Try LDI (same as before)
        b.label("try_ldi");
        b.ldi(2, 76); b.bne(1, 2, "try_store");
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 68); b.bne(1, 2, "error");
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 73); b.bne(1, 2, "error");

        b.label("ldi_skip_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "ldi_skip_ws1");

        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);

        b.mov(11, 6); b.sub(1, 6);

        b.ldi(4, 50000); b.load(4, 5);
        b.ldi(7, 16); b.shl(6, 7);
        b.or(5, 7); b.store(3, 7);
        b.add(10, 3);

        b.label("ldi_skip_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "ldi_skip_ws2");
        b.beq(1, 15, "ldi_skip_ws2");

        b.ldi(6, 0);
        b.label("ldi_num_loop");
        b.ldi(2, 48);
        b.blt(1, 2, "ldi_num_done");
        b.ldi(2, 58);
        b.bgeu(1, 2, "ldi_num_done");

        b.mov(11, 7);
        b.sub(1, 7);

        b.mul(9, 6);
        b.add(7, 6);

        b.add(10, 0);
        b.load(0, 1);
        b.jmp("ldi_num_loop");

        b.label("ldi_num_done");
        b.store(3, 6);
        b.add(10, 3);
        b.jmp("main_loop");

        // Try STORE
        b.label("try_store");
        b.ldi(2, 83); b.bne(1, 2, "try_add");  // 'S'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 84); b.bne(1, 2, "error");  // 'T'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 79); b.bne(1, 2, "error");  // 'O'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 82); b.bne(1, 2, "error");  // 'R'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 69); b.bne(1, 2, "error");  // 'E'

        // Skip spaces
        b.label("store_skip_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "store_skip_ws1");

        // Expect 'r'
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);  // first digit

        // r6 = digit - 48 (addr register)
        b.mov(11, 6); b.sub(1, 6);

        // Skip comma/space
        b.label("store_skip_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "store_skip_ws2");
        b.beq(1, 15, "store_skip_ws2");

        // Expect 'r'
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);  // second digit

        // r7 = digit - 48 (val register)
        b.mov(11, 7); b.sub(1, 7);

        // Emit STORE opcode: template | (addr << 16) | (val << 24)
        b.ldi(4, 50001); b.load(4, 5);
        b.ldi(8, 16); b.shl(6, 8);      // r8 = addr << 16
        b.mov(8, 2);                    // r2 = addr << 16 (save)
        b.ldi(8, 24); b.shl(7, 8);      // r8 = val << 24
        b.or(2, 5);                     // r5 = addr | template
        b.or(8, 5);                     // r5 = final opcode
        b.store(3, 5);
        b.add(10, 3);
        b.add(10, 0);                   // Advance text pointer
        b.jmp("main_loop");

        // Try ADD
        b.label("try_add");
        b.ldi(2, 65); b.bne(1, 2, "try_halt");  // 'A'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 68); b.bne(1, 2, "error");  // 'D'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 68); b.bne(1, 2, "error");  // 'D'

        // Skip spaces
        b.label("add_skip_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "add_skip_ws1");

        // Expect 'r'
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);  // first digit

        // r6 = digit - 48 (src register)
        b.mov(11, 6); b.sub(1, 6);

        // Skip comma/space
        b.label("add_skip_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "add_skip_ws2");
        b.beq(1, 15, "add_skip_ws2");

        // Expect 'r'
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);  // second digit

        // r7 = digit - 48 (dst register)
        b.mov(11, 7); b.sub(1, 7);

        // Emit ADD opcode: template | (src << 16) | (dst << 24)
        b.ldi(4, 50002); b.load(4, 5);  // r5 = ADD template
        b.ldi(8, 16); b.shl(6, 8);      // r8 = src << 16
        b.mov(8, 2);                    // r2 = src << 16 (save it!)
        b.ldi(8, 24); b.shl(7, 8);      // r8 = dst << 24
        b.or(2, 5);                     // r5 = r2 | r5 = (src << 16) | template
        b.or(8, 5);                     // r5 = r8 | r5 = final opcode
        b.store(3, 5);
        b.add(10, 3);
        b.add(10, 0);                   // Advance text pointer past second register digit
        b.jmp("main_loop");

        // Try HALT
        b.label("try_halt");
        b.ldi(2, 72); b.bne(1, 2, "check_end");  // 'H'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 65); b.bne(1, 2, "error");  // 'A'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 76); b.bne(1, 2, "error");  // 'L'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 84); b.bne(1, 2, "error");  // 'T'

        b.ldi(4, 50002); b.load(4, 5);
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
        println!("Assembler program size: {} pixels", program.len());
        for &(addr, val) in &program {
            scheduler.poke_substrate_single(addr, val);
        }

        // PHASE 1: Execute assembler to compile the program
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,  // unrestricted
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(1, &config).expect("Failed to spawn assembler VM");
        println!("\n=== PHASE 1: COMPILING ===");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Verify compiled program
        let r200 = scheduler.peek_substrate_single(200);
        let r201 = scheduler.peek_substrate_single(201);
        let r202 = scheduler.peek_substrate_single(202);
        let r203 = scheduler.peek_substrate_single(203);
        let r204 = scheduler.peek_substrate_single(204);
        let r205 = scheduler.peek_substrate_single(205);

        println!("\n=== COMPILED OUTPUT ===");
        println!("  addr 200: 0x{:08X} (LDI r1)", r200);
        println!("  addr 201: 0x{:08X} (42)", r201);
        println!("  addr 202: 0x{:08X} (LDI r2)", r202);
        println!("  addr 203: 0x{:08X} (300)", r203);
        println!("  addr 204: 0x{:08X} (STORE r2, r1)", r204);
        println!("  addr 205: 0x{:08X} (HALT)", r205);

        // PHASE 2: Execute the compiled program
        println!("\n=== PHASE 2: EXECUTING COMPILED PROGRAM ===");

        let compiled_config = VmConfig {
            entry_point: 200,
            parent_id: 0xFF,
            base_addr: 1,
            bound_addr: 0,  // unrestricted
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(2, &compiled_config).expect("Failed to spawn compiled VM");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // PHASE 3: Verify result
        let result = scheduler.peek_substrate_single(300);

        println!("\n=== PHASE 3: VERIFICATION ===");
        println!("  addr 300: expected 42, got {}", result);

        if result == 42 {
            println!("\n  ╔═══════════════════════════════════════════════════════╗");
            println!("  ║  SELF-COMPILE-AND-EXECUTE WORKS!              ║");
            println!("  ║  GPU compiled text → opcodes, then ran it.         ║");
            println!("  ║  Full sovereignty demonstrated.                      ║");
            println!("  ╚═══════════════════════════════════════════════════════╝");
        } else {
            println!("\n  FAILED: expected 42 at addr 300, got {}", result);
        }

        assert_eq!(result, 42, "STORE should have written 42 to addr 300");
    }

    // ProgramBuilder
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
            self.ins(glyph(129, 0, rs1, rs2));
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
