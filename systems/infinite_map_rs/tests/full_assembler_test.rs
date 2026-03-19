//! Full Assembler Loop Test
//!
//! Milestone: FULL ASSEMBLER LOOP
//!
//! Proves that a glyph program can parse multiple lines of ASCII text
//! and emit a complete executable program.
//!
//! Text Buffer: "LDI r3, 42\nHALT"
//! Compiled: 200: LDI r3, 201: 42, 202: HALT

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};
    use std::collections::HashMap;

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    struct ProgramBuilder {
        instructions: Vec<(u32, u32)>,
        labels: HashMap<String, u32>,
        fixups: Vec<(u32, String)>,
        current_addr: u32,
    }

    impl ProgramBuilder {
        fn new() -> Self {
            Self {
                instructions: Vec::new(),
                labels: HashMap::new(),
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

        fn data(&mut self, val: u32) {
            self.instructions.push((self.current_addr, val));
            self.current_addr += 1;
        }

        fn branch(&mut self, cond: u8, rs1: u8, rs2: u8, target: &str) {
            self.ins(glyph(10, cond, rs1, rs2));
            self.fixups.push((self.current_addr, target.to_string()));
            self.current_addr += 1; // placeholder for offset
        }

        fn build(mut self) -> Vec<(u32, u32)> {
            for (addr, target) in self.fixups {
                let target_addr = *self.labels.get(&target).expect(&format!("Missing label: {}", target));
                // Branch at addr-1. PC is addr+1 during offset read.
                // offset = target - (base + 2)
                let offset = (target_addr as i32) - (addr as i32 + 1);
                self.instructions.push((addr, offset as u32));
            }
            self.instructions.sort_by_key(|(a, _)| *a);
            self.instructions
        }

        // Helpers
        fn ldi(&mut self, reg: u8, val: u32) { self.ins(glyph(1, 0, reg, 0)); self.data(val); }
        fn load(&mut self, src_reg: u8, dst_reg: u8) { self.ins(glyph(3, 0, src_reg, dst_reg)); }
        fn store(&mut self, addr_reg: u8, val_reg: u8) { self.ins(glyph(4, 0, addr_reg, val_reg)); }
        fn add(&mut self, rs1: u8, rs2: u8) { self.ins(glyph(5, 0, rs1, rs2)); }
        fn sub(&mut self, rs1: u8, rs2: u8) { self.ins(glyph(6, 0, rs1, rs2)); }
        fn mul(&mut self, rs1: u8, rs2: u8) { self.ins(glyph(7, 0, rs1, rs2)); }
        fn or(&mut self, rs1: u8, rs2: u8) { self.ins(glyph(129, 0, rs1, rs2)); }
        fn shl(&mut self, rs1: u8, rs2: u8) { self.ins(glyph(131, 0, rs1, rs2)); }
        fn mov(&mut self, rs1: u8, rs2: u8) { self.ins(glyph(2, 0, rs1, rs2)); }
        fn halt(&mut self) { self.ins(glyph(13, 0, 0, 0)); }
        fn beq(&mut self, r1: u8, r2: u8, target: &str) { self.branch(0, r1, r2, target); }
        fn bne(&mut self, r1: u8, r2: u8, target: &str) { self.branch(1, r1, r2, target); }
        fn jmp(&mut self, target: &str) { self.beq(10, 10, target); } // r10=r10
    }

    fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });
        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions::default()))?;
        let (device, queue) = pollster::block_on(adapter.request_device(&wgpu::DeviceDescriptor {
            label: Some("Full Assembler Test Device"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            ..Default::default()
        }, None)).ok()?;
        Some((Arc::new(device), Arc::new(queue)))
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_full_assembler_loop() {
        let (device, queue) = create_test_device().unwrap();
        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};
        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Assembler RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1, sample_count: 1, dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        scheduler.set_ram_texture(ram_texture);

        // --- Setup Data ---
        let text = "LDI r3, 42\nHALT";
        for (i, c) in text.chars().enumerate() {
            scheduler.poke_substrate_single(10000 + i as u32, c as u32);
        }
        scheduler.poke_substrate_single(10000 + text.len() as u32, 0); // Null term
        scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0)); // LDI
        scheduler.poke_substrate_single(50001, glyph(13, 0, 0, 0)); // HALT

        // --- Assembler Program ---
        let mut b = ProgramBuilder::new();
        // r0: text_ptr, r3: emit_ptr, r10: 1, r11: 48, r12: 32(' '), r13: 10('\n'), r14: 114('r'), r15: 44(',')
        b.ldi(0, 10000); b.ldi(3, 200); b.ldi(10, 1); b.ldi(11, 48); b.ldi(12, 32); b.ldi(13, 10); b.ldi(14, 114); b.ldi(15, 44);
        
        b.label("main_loop");
        b.load(0, 1); // r1 = char
        b.beq(1, 12, "skip"); b.beq(1, 13, "skip"); b.jmp("try_ldi");
        b.label("skip"); b.add(10, 0); b.jmp("main_loop");

        b.label("try_ldi");
        b.ldi(2, 76); b.bne(1, 2, "try_halt"); // if !'L'
        b.add(10, 0); b.load(0, 1); b.ldi(2, 68); b.bne(1, 2, "error"); // !'D'
        b.add(10, 0); b.load(0, 1); b.ldi(2, 73); b.bne(1, 2, "error"); // !'I'
        
        // Match found! Parse operands
        b.label("ws1"); b.add(10, 0); b.load(0, 1); b.beq(1, 12, "ws1"); // skip spaces
        b.bne(1, 14, "error"); // expect 'r'
        b.add(10, 0); b.load(0, 1); // r1 = digit '3'
        b.mov(11, 6); b.sub(1, 6); // r6 = r1 - 48 = 3
        
        // Emit LDI r3
        b.ldi(4, 50000); b.load(4, 5); // r5 = (1,0,0,0)
        b.ldi(7, 16); b.shl(6, 7); // r7 = 3 << 16
        b.or(5, 7); b.store(3, 7); // [r3] = (1,0,3,0)
        b.add(10, 3); // emit_ptr++
        
        // Skip whitespace/comma
        b.label("ws2"); b.add(10, 0); b.load(0, 1); b.beq(1, 12, "ws2"); b.beq(1, 15, "ws2");
        
        // Parse 42
        b.mov(11, 6); b.sub(1, 6); // r6 = char - 48 = 4
        b.ldi(7, 10); b.mul(7, 6); // r6 = 40
        b.add(10, 0); b.load(0, 1); b.mov(11, 8); b.sub(1, 8); // r8 = char - 48 = 2
        b.add(8, 6); // r6 = 42
        b.store(3, 6); b.add(10, 3); // emit 42, emit_ptr++
        b.add(10, 0); b.jmp("main_loop");

        b.label("try_halt");
        b.ldi(2, 72); b.bne(1, 2, "check_end"); // if !'H'
        b.ldi(4, 50001); b.load(4, 5); b.store(3, 5); // emit HALT
        b.add(10, 3); b.ldi(7, 4); b.add(7, 0); b.jmp("main_loop"); // past "HALT"

        b.label("check_end");
        b.ldi(2, 0); b.beq(1, 2, "done");
        b.label("error"); b.halt();
        b.label("done"); b.halt();

        let program = b.build();
        for &(addr, val) in &program { scheduler.poke_substrate_single(addr, val); }

        let config = VmConfig { entry_point: 0, parent_id: 0xFF, base_addr: 0, bound_addr: 0, initial_regs: [0; 128] , ..Default::default()};
        scheduler.spawn_vm(0, &config).unwrap();
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        let r200 = scheduler.peek_substrate_single(200);
        let r201 = scheduler.peek_substrate_single(201);
        let r202 = scheduler.peek_substrate_single(202);

        println!("\n=== VERIFICATION ===");
        println!("  addr 200: expected 0x00030001, got 0x{:08X}", r200);
        println!("  addr 201: expected 0x0000002A, got 0x{:08X}", r201);
        println!("  addr 202: expected 0x0000000D, got 0x{:08X}", r202);

        assert_eq!(r200, glyph(1, 0, 3, 0));
        assert_eq!(r201, 42);
        assert_eq!(r202, glyph(13, 0, 0, 0));
    }

    #[test]
    fn test_legacy_opcode_aliases() {
        use infinite_map_rs::glyph_assembler::Opcode;

        // Test legacy Python compiler opcodes are aliased
        assert_eq!(Opcode::from_str("JUMP"), Some(Opcode::Jmp), "JUMP should alias to JMP");
        assert_eq!(Opcode::from_str("EXIT"), Some(Opcode::Halt), "EXIT should alias to HALT");
        assert_eq!(Opcode::from_str("RETURN"), Some(Opcode::Ret), "RETURN should alias to RET");
        assert_eq!(Opcode::from_str("LD"), Some(Opcode::Load), "LD should alias to LOAD");
        assert_eq!(Opcode::from_str("ST"), Some(Opcode::Store), "ST should alias to STORE");
    }
}
