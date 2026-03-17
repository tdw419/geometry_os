//! Text Boots RISC-V — The Complete Sovereignty Chain
//!
//! THE FINAL TEST.
//!
//! Flow:
//! 1. ASCII text for a copy-loop bootloader is stored in the texture
//! 2. A GPU assembler (glyph program) compiles it into executable opcodes
//! 3. The compiled glyph program copies 8 RISC-V instructions from atlas to boot region
//! 4. Host reads back the boot region and feeds it to the RISC-V VM
//! 5. RISC-V VM executes → UART outputs "Hi\n"
//!
//! No CPU writes program logic. The CPU only:
//! - Stores the TEXT (frozen bootstrap)
//! - Stores the assembler program (frozen bootstrap)
//! - Stores the RISC-V instructions in the atlas (data, not logic)
//! - Reads back the result
//!
//! The GPU does ALL compilation and data movement.

#[cfg(test)]
mod tests {
    use std::sync::{Arc, Mutex};

    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    /// RISC-V instruction encoders
    mod rv32 {
        pub fn lui(rd: u32, imm20: u32) -> u32 {
            (imm20 << 12) | (rd << 7) | 0x37
        }
        pub fn addi(rd: u32, rs1: u32, imm12: i32) -> u32 {
            let imm = (imm12 as u32) & 0xFFF;
            (imm << 20) | (rs1 << 15) | (0 << 12) | (rd << 7) | 0x13
        }
        pub fn sw(rs2: u32, rs1: u32, offset: i32) -> u32 {
            let imm = (offset as u32) & 0xFFF;
            ((imm >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (2 << 12) | ((imm & 0x1F) << 7) | 0x23
        }
        pub fn ebreak() -> u32 {
            0x00100073
        }
    }

    /// "Hi\n" RISC-V program: 8 instructions
    fn riscv_hello() -> Vec<u32> {
        vec![
            rv32::lui(1, 0x10000),    // x1 = 0x10000000 (UART)
            rv32::addi(10, 0, 72),    // a0 = 'H'
            rv32::sw(10, 1, 0),       // UART = 'H'
            rv32::addi(10, 0, 105),   // a0 = 'i'
            rv32::sw(10, 1, 0),       // UART = 'i'
            rv32::addi(10, 0, 10),    // a0 = '\n'
            rv32::sw(10, 1, 0),       // UART = '\n'
            rv32::ebreak(),           // halt
        ]
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
                label: Some("Text Boots RISC-V"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .ok()?;
        Some((Arc::new(device), Arc::new(queue)))
    }

    // ========================================================================
    // ProgramBuilder (identical to fibonacci test)
    // ========================================================================
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
                let target_addr = *self.labels.get(&target)
                    .unwrap_or_else(|| panic!("Missing label: {}", target));
                let offset = (target_addr as i32) - (addr as i32 + 1);
                self.instructions.push((addr, offset as u32));
            }
            self.instructions.sort_by_key(|(a, _)| *a);
            self.instructions
        }
        fn ldi(&mut self, reg: u8, val: u32) { self.ins(glyph(1, 0, reg, 0)); self.ins(val); }
        fn load(&mut self, s: u8, d: u8) { self.ins(glyph(3, 0, s, d)); }
        fn store(&mut self, a: u8, v: u8) { self.ins(glyph(4, 0, a, v)); }
        fn add(&mut self, a: u8, b: u8) { self.ins(glyph(5, 0, a, b)); }
        fn sub(&mut self, a: u8, b: u8) { self.ins(glyph(6, 0, a, b)); }
        fn mul(&mut self, a: u8, b: u8) { self.ins(glyph(7, 0, a, b)); }
        fn or(&mut self, a: u8, b: u8) { self.ins(glyph(129, 0, a, b)); }
        fn shl(&mut self, a: u8, b: u8) { self.ins(glyph(131, 0, a, b)); }
        fn mov(&mut self, s: u8, d: u8) { self.ins(glyph(2, 0, s, d)); }
        fn halt(&mut self) { self.ins(glyph(13, 0, 0, 0)); }
        fn beq(&mut self, a: u8, b: u8, t: &str) { self.branch(0, a, b, t); }
        fn bne(&mut self, a: u8, b: u8, t: &str) { self.branch(1, a, b, t); }
        fn blt(&mut self, a: u8, b: u8, t: &str) { self.branch(2, a, b, t); }
        fn bgeu(&mut self, a: u8, b: u8, t: &str) { self.branch(5, a, b, t); }
        fn jmp(&mut self, t: &str) { self.beq(10, 10, t); }
    }

    // ========================================================================
    // Build the GPU assembler that handles: LDI, LOAD, STORE, ADD, BNE, HALT
    // ========================================================================
    fn build_assembler(atlas_base: u32) -> Vec<(u32, u32)> {
        let mut b = ProgramBuilder::new();

        // Register map:
        //   r0  = text_ptr
        //   r1  = current_char
        //   r2  = temp
        //   r3  = emit_ptr
        //   r4  = atlas_ptr
        //   r5  = template
        //   r6  = reg number / accumulator
        //   r7  = temp
        //   r8  = temp
        //   r9  = constant 10 (multiplier)
        //   r10 = constant 1
        //   r11 = constant 48 ('0')
        //   r12 = ' ' (32)
        //   r13 = '\n' (10)
        //   r14 = 'r' (114)
        //   r15 = ',' (44)

        // --- INIT ---
        b.ldi(0, 10000);             // text_ptr
        b.ldi(3, 500);               // emit_ptr
        b.ldi(9, 10);                // multiplier
        b.ldi(10, 1);
        b.ldi(11, 48);               // '0'
        b.ldi(12, 32);               // ' '
        b.ldi(13, 10);               // '\n'
        b.ldi(14, 114);              // 'r'
        b.ldi(15, 44);               // ','

        // --- MAIN LOOP ---
        b.label("main_loop");
        b.load(0, 1);                // r1 = mem[r0]
        b.beq(1, 12, "skip_ws");
        b.beq(1, 13, "skip_ws");
        b.jmp("dispatch");

        b.label("skip_ws");
        b.add(10, 0);
        b.jmp("main_loop");

        // --- DISPATCH: first character ---
        b.label("dispatch");
        b.ldi(2, 76);                // 'L'
        b.beq(1, 2, "try_l");
        b.ldi(2, 65);                // 'A'
        b.beq(1, 2, "try_add");
        b.ldi(2, 83);                // 'S'
        b.beq(1, 2, "try_store");
        b.ldi(2, 66);                // 'B'
        b.beq(1, 2, "try_bne");
        b.ldi(2, 72);                // 'H'
        b.beq(1, 2, "try_halt");
        // Null terminator = done
        b.ldi(2, 0);
        b.beq(1, 2, "done");
        b.jmp("error");

        // === 'L' → LDI or LOAD ===
        b.label("try_l");
        b.add(10, 0); b.load(0, 1);  // second char
        b.ldi(2, 68);                // 'D' → LDI
        b.beq(1, 2, "parse_ldi");
        b.ldi(2, 79);                // 'O' → LOAD
        b.beq(1, 2, "parse_load");
        b.jmp("error");

        // --- LDI rX, imm ---
        b.label("parse_ldi");
        b.add(10, 0); b.load(0, 1);  // 'I'
        b.ldi(2, 73); b.bne(1, 2, "error");

        b.label("ldi_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "ldi_ws1");

        b.bne(1, 14, "error");       // 'r'
        b.add(10, 0); b.load(0, 1);  // digit
        b.mov(11, 6); b.sub(1, 6);   // r6 = reg number

        // Emit LDI opcode
        b.ldi(4, atlas_base);
        b.load(4, 5);                // r5 = LDI template
        b.ldi(8, 16); b.shl(6, 8);  // r8 = reg << 16
        b.or(5, 8);                  // r8 = template | (reg << 16)
        b.store(3, 8);
        b.add(10, 3);

        // Skip comma/space
        b.label("ldi_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "ldi_ws2");
        b.beq(1, 15, "ldi_ws2");

        // Multi-digit number
        b.ldi(6, 0);                 // acc = 0
        b.label("ldi_num");
        b.ldi(2, 48); b.blt(1, 2, "ldi_num_done");
        b.ldi(2, 58); b.bgeu(1, 2, "ldi_num_done");
        b.mov(11, 7); b.sub(1, 7);  // digit
        b.mul(9, 6);                 // acc *= 10
        b.add(7, 6);                 // acc += digit
        b.add(10, 0); b.load(0, 1);
        b.jmp("ldi_num");

        b.label("ldi_num_done");
        b.store(3, 6);               // emit immediate
        b.add(10, 3);
        b.jmp("main_loop");

        // --- LOAD rX, rY ---
        b.label("parse_load");
        b.add(10, 0); b.load(0, 1);  // 'A'
        b.ldi(2, 65); b.bne(1, 2, "error");
        b.add(10, 0); b.load(0, 1);  // 'D'
        b.ldi(2, 68); b.bne(1, 2, "error");

        // Parse two registers, emit single pixel
        b.jmp("parse_2reg_emit_load");

        // --- Shared: parse 2 regs, emit opcode from atlas ---
        // Expects atlas offset in r20 before jumping here
        // Actually, let's inline for each instruction to keep it simple.

        // LOAD: parse " rX, rY" and emit glyph(3, 0, X, Y)
        b.label("parse_2reg_emit_load");
        b.label("load_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "load_ws1");
        b.bne(1, 14, "error");       // 'r'
        b.add(10, 0); b.load(0, 1);  // src digit
        b.mov(11, 6); b.sub(1, 6);   // r6 = src reg
        b.label("load_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "load_ws2");
        b.beq(1, 15, "load_ws2");
        b.bne(1, 14, "error");       // 'r'
        b.add(10, 0); b.load(0, 1);  // dst digit
        b.mov(11, 7); b.sub(1, 7);   // r7 = dst reg

        // Emit: template | (src << 16) | (dst << 24)
        b.ldi(4, atlas_base + 1);    // LOAD template
        b.load(4, 5);
        b.ldi(8, 16); b.shl(6, 8);  // r8 = src << 16
        b.mov(8, 2);                 // save
        b.ldi(8, 24); b.shl(7, 8);  // r8 = dst << 24
        b.or(2, 5);                  // r5 |= src<<16
        b.or(8, 5);                  // r5 |= dst<<24
        b.store(3, 5);
        b.add(10, 3);
        b.add(10, 0);                // advance past last digit
        b.jmp("main_loop");

        // === ADD rX, rY ===
        b.label("try_add");
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 68); b.bne(1, 2, "error"); // 'D'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 68); b.bne(1, 2, "error"); // 'D'

        b.label("add_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "add_ws1");
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);
        b.mov(11, 6); b.sub(1, 6);   // src
        b.label("add_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "add_ws2");
        b.beq(1, 15, "add_ws2");
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);
        b.mov(11, 7); b.sub(1, 7);   // dst

        b.ldi(4, atlas_base + 3);    // ADD template
        b.load(4, 5);
        b.ldi(8, 16); b.shl(6, 8);
        b.mov(8, 2);
        b.ldi(8, 24); b.shl(7, 8);
        b.or(2, 5);
        b.or(8, 5);
        b.store(3, 5);
        b.add(10, 3);
        b.add(10, 0);
        b.jmp("main_loop");

        // === STORE rX, rY ===
        b.label("try_store");
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 84); b.bne(1, 2, "error"); // 'T'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 79); b.bne(1, 2, "error"); // 'O'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 82); b.bne(1, 2, "error"); // 'R'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 69); b.bne(1, 2, "error"); // 'E'

        b.label("store_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "store_ws1");
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);
        b.mov(11, 6); b.sub(1, 6);   // addr reg
        b.label("store_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "store_ws2");
        b.beq(1, 15, "store_ws2");
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);
        b.mov(11, 7); b.sub(1, 7);   // val reg

        b.ldi(4, atlas_base + 2);    // STORE template
        b.load(4, 5);
        b.ldi(8, 16); b.shl(6, 8);
        b.mov(8, 2);
        b.ldi(8, 24); b.shl(7, 8);
        b.or(2, 5);
        b.or(8, 5);
        b.store(3, 5);
        b.add(10, 3);
        b.add(10, 0);
        b.jmp("main_loop");

        // === BNE rX, rY, offset ===
        b.label("try_bne");
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 78); b.bne(1, 2, "error"); // 'N'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 69); b.bne(1, 2, "error"); // 'E'

        b.label("bne_ws1");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "bne_ws1");
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);
        b.mov(11, 6); b.sub(1, 6);   // rs1
        b.label("bne_ws2");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "bne_ws2");
        b.beq(1, 15, "bne_ws2");
        b.bne(1, 14, "error");
        b.add(10, 0); b.load(0, 1);
        b.mov(11, 7); b.sub(1, 7);   // rs2

        // Emit BNE opcode: template | (rs1 << 16) | (rs2 << 24)
        b.ldi(4, atlas_base + 4);    // BNE template
        b.load(4, 5);
        b.ldi(8, 16); b.shl(6, 8);
        b.mov(8, 2);
        b.ldi(8, 24); b.shl(7, 8);
        b.or(2, 5);
        b.or(8, 5);
        b.store(3, 5);
        b.add(10, 3);

        // Parse signed offset: skip comma/space, check '-', parse digits
        b.label("bne_ws3");
        b.add(10, 0); b.load(0, 1);
        b.beq(1, 12, "bne_ws3");
        b.beq(1, 15, "bne_ws3");

        // Check negative
        b.ldi(2, 45);               // '-'
        b.bne(1, 2, "bne_pos");

        // Negative offset
        b.add(10, 0); b.load(0, 1); // first digit after '-'
        b.ldi(6, 0);                // acc = 0
        b.label("bne_neg_loop");
        b.ldi(2, 48); b.blt(1, 2, "bne_neg_done");
        b.ldi(2, 58); b.bgeu(1, 2, "bne_neg_done");
        b.mov(11, 7); b.sub(1, 7);
        b.mul(9, 6);
        b.add(7, 6);
        b.add(10, 0); b.load(0, 1);
        b.jmp("bne_neg_loop");
        b.label("bne_neg_done");
        // Negate: r6 = 0 - r6
        b.ldi(2, 0); b.sub(2, 6);   // r6 = r2 - r6 = 0 - r6
        b.jmp("bne_emit_offset");

        // Positive offset
        b.label("bne_pos");
        b.ldi(6, 0);
        b.label("bne_pos_loop");
        b.ldi(2, 48); b.blt(1, 2, "bne_emit_offset");
        b.ldi(2, 58); b.bgeu(1, 2, "bne_emit_offset");
        b.mov(11, 7); b.sub(1, 7);
        b.mul(9, 6);
        b.add(7, 6);
        b.add(10, 0); b.load(0, 1);
        b.jmp("bne_pos_loop");

        b.label("bne_emit_offset");
        b.store(3, 6);              // emit offset pixel
        b.add(10, 3);
        b.jmp("main_loop");

        // === HALT ===
        b.label("try_halt");
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 65); b.bne(1, 2, "error"); // 'A'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 76); b.bne(1, 2, "error"); // 'L'
        b.add(10, 0); b.load(0, 1);
        b.ldi(2, 84); b.bne(1, 2, "error"); // 'T'

        b.ldi(4, atlas_base + 5);    // HALT template
        b.load(4, 5);
        b.store(3, 5);
        b.add(10, 3);
        b.add(10, 0);                // advance past 'T'
        b.jmp("main_loop");

        // === END / ERROR ===
        b.label("done");
        b.halt();

        b.label("error");
        b.halt();

        b.build()
    }

    #[test]
    #[ignore = "Requires GPU"]
    fn test_text_boots_riscv() {
        let (device, queue) = match create_test_device() {
            Some(d) => d,
            None => { println!("SKIP: No GPU"); return; }
        };

        use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

        let shadow_ram = Arc::new(Mutex::new(vec![0u8; 64 * 1024 * 1024]));
        let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());

        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Text Boots RISC-V RAM"),
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

        println!("\n╔════════════════════════════════════════════════════════════╗");
        println!("║  TEXT BOOTS RISC-V — THE COMPLETE SOVEREIGNTY CHAIN      ║");
        println!("╚════════════════════════════════════════════════════════════╝\n");

        // ================================================================
        // SETUP: Memory layout
        //   10000-10099  : Source text (bootloader assembly)
        //   20000-20007  : RISC-V instructions (atlas data)
        //   60000-60005  : Assembler opcode templates
        //   0-499        : Assembler program (glyph code)
        //   500-517      : Compiled bootloader (output of assembler)
        //   1000-1007    : Boot region (RISC-V instructions copied here)
        // ================================================================

        // --- 1. Source text: the copy-loop bootloader ---
        // This text will be compiled by the GPU assembler into a glyph
        // program that copies RISC-V instructions from 20000 to 1000.
        let bootloader_text = "\
LDI r0, 20000\n\
LDI r1, 1000\n\
LDI r2, 0\n\
LDI r3, 1\n\
LDI r4, 8\n\
LOAD r0, r5\n\
STORE r1, r5\n\
ADD r3, r0\n\
ADD r3, r1\n\
ADD r3, r2\n\
BNE r2, r4, -7\n\
HALT";

        println!("--- Source Text (bootloader) ---");
        println!("{}", bootloader_text);
        println!();

        for (i, b) in bootloader_text.bytes().enumerate() {
            scheduler.poke_substrate_single(10000 + i as u32, b as u32);
        }
        scheduler.poke_substrate_single(10000 + bootloader_text.len() as u32, 0);

        // --- 2. RISC-V instructions in atlas ---
        let riscv = riscv_hello();
        println!("--- RISC-V Program (8 instructions at 20000) ---");
        for (i, &instr) in riscv.iter().enumerate() {
            scheduler.poke_substrate_single(20000 + i as u32, instr);
            println!("  20000+{}: 0x{:08X}", i, instr);
        }
        println!();

        // --- 3. Assembler templates ---
        let atlas_base: u32 = 60000;
        scheduler.poke_substrate_single(atlas_base + 0, glyph(1, 0, 0, 0));   // LDI
        scheduler.poke_substrate_single(atlas_base + 1, glyph(3, 0, 0, 0));   // LOAD
        scheduler.poke_substrate_single(atlas_base + 2, glyph(4, 0, 0, 0));   // STORE
        scheduler.poke_substrate_single(atlas_base + 3, glyph(5, 0, 0, 0));   // ADD
        scheduler.poke_substrate_single(atlas_base + 4, glyph(10, 1, 0, 0));  // BNE (stratum=1)
        scheduler.poke_substrate_single(atlas_base + 5, glyph(13, 0, 0, 0));  // HALT

        // --- 4. Assembler program ---
        let assembler = build_assembler(atlas_base);
        println!("Assembler size: {} pixels", assembler.len());
        assert!(assembler.len() <= 500, "Assembler too large: {} > 500", assembler.len());
        for &(addr, val) in &assembler {
            scheduler.poke_substrate_single(addr, val);
        }

        // ================================================================
        // PHASE 1: GPU compiles bootloader text → glyph program at 500
        // ================================================================
        println!("\n=== PHASE 1: GPU COMPILES BOOTLOADER TEXT ===\n");

        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(0, &config).expect("spawn assembler");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        // Verify compiled output
        println!("Compiled bootloader at addr 500:");
        // Expected layout:
        //   500: LDI r0     501: 20000
        //   502: LDI r1     503: 1000
        //   504: LDI r2     505: 0
        //   506: LDI r3     507: 1
        //   508: LDI r4     509: 8
        //   510: LOAD r0,r5
        //   511: STORE r1,r5
        //   512: ADD r3,r0
        //   513: ADD r3,r1
        //   514: ADD r3,r2
        //   515: BNE r2,r4  516: -7
        //   517: HALT
        let expected: Vec<(u32, u32, &str)> = vec![
            (500, glyph(1, 0, 0, 0),  "LDI r0"),
            (501, 20000,              "DATA 20000"),
            (502, glyph(1, 0, 1, 0),  "LDI r1"),
            (503, 1000,               "DATA 1000"),
            (504, glyph(1, 0, 2, 0),  "LDI r2"),
            (505, 0,                  "DATA 0"),
            (506, glyph(1, 0, 3, 0),  "LDI r3"),
            (507, 1,                  "DATA 1"),
            (508, glyph(1, 0, 4, 0),  "LDI r4"),
            (509, 8,                  "DATA 8"),
            (510, glyph(3, 0, 0, 5),  "LOAD r0, r5"),
            (511, glyph(4, 0, 1, 5),  "STORE r1, r5"),
            (512, glyph(5, 0, 3, 0),  "ADD r3, r0"),
            (513, glyph(5, 0, 3, 1),  "ADD r3, r1"),
            (514, glyph(5, 0, 3, 2),  "ADD r3, r2"),
            (515, glyph(10, 1, 2, 4), "BNE r2, r4"),
            (516, (-7i32) as u32,     "OFFSET -7"),
            (517, glyph(13, 0, 0, 0), "HALT"),
        ];

        let mut compile_ok = true;
        for &(addr, exp, name) in &expected {
            let got = scheduler.peek_substrate_single(addr);
            let mark = if got == exp { "✓" } else { "✗" };
            if got != exp { compile_ok = false; }
            println!("  {} [{}] {}: expected 0x{:08X}, got 0x{:08X}",
                mark, addr, name, exp, got);
        }

        if !compile_ok {
            println!("\n  COMPILATION FAILED. Dumping raw:");
            for i in 500..525 {
                let v = scheduler.peek_substrate_single(i);
                if v != 0 { println!("    {}: 0x{:08X}", i, v); }
            }
            assert!(false, "Phase 1 compilation failed");
        }
        println!("\n  ✓ GPU compiled bootloader from text\n");

        // ================================================================
        // PHASE 2: Execute compiled bootloader → copies RISC-V to boot region
        // ================================================================
        println!("=== PHASE 2: COMPILED BOOTLOADER COPIES RISC-V INSTRUCTIONS ===\n");

        let boot_config = VmConfig {
            entry_point: 500,
            parent_id: 0xFF,
            base_addr: 1,       // different from assembler
            bound_addr: 0,
            initial_regs: [0; 128],
        };
        scheduler.spawn_vm(1, &boot_config).expect("spawn bootloader");
        scheduler.execute_frame();
        scheduler.sync_gpu_to_shadow();

        let mut copy_ok = true;
        for (i, &exp) in riscv.iter().enumerate() {
            let got = scheduler.peek_substrate_single(1000 + i as u32);
            let mark = if got == exp { "✓" } else { "✗" };
            if got != exp { copy_ok = false; }
            println!("  {} boot[{}]: expected 0x{:08X}, got 0x{:08X}",
                mark, 1000 + i as u32, exp, got);
        }
        assert!(copy_ok, "Phase 2: bootloader failed to copy RISC-V instructions");
        println!("\n  ✓ Bootloader copied 8 RISC-V instructions to boot region\n");

        // ================================================================
        // PHASE 3: Feed to RISC-V VM → UART output
        // ================================================================
        println!("=== PHASE 3: RISC-V VM EXECUTES → UART OUTPUT ===\n");

        // Extract bytes from boot region
        let mut kernel_bytes: Vec<u8> = Vec::new();
        for i in 0..riscv.len() {
            let word = scheduler.peek_substrate_single(1000 + i as u32);
            kernel_bytes.extend_from_slice(&word.to_le_bytes());
        }

        use infinite_map_rs::riscv_linux_vm::RiscVLinuxVM;
        let mut riscv_vm = RiscVLinuxVM::new(device.clone(), queue.clone(), 64 * 1024 * 1024);
        riscv_vm.initialize();
        riscv_vm.load_kernel(&kernel_bytes);
        riscv_vm.step();

        let stats = riscv_vm.read_stats();
        let char_count = stats[0] as usize;
        let mut output = String::new();
        if char_count > 0 && char_count < 60 {
            for i in 0..char_count {
                output.push((stats[1 + i] & 0xFF) as u8 as char);
            }
        }

        let state = riscv_vm.read_state();
        println!("  RISC-V PC:     0x{:08X}", riscv_vm.read_pc());
        println!("  Instructions:  {}", state.instruction_count);
        println!("  UART chars:    {}", char_count);
        println!("  UART output:   {:?}", output);

        let success = output == "Hi\n";

        println!();
        if success {
            println!("  ╔════════════════════════════════════════════════════════════╗");
            println!("  ║                                                            ║");
            println!("  ║   TEXT BOOTS RISC-V. THE SOVEREIGNTY CHAIN IS COMPLETE.    ║");
            println!("  ║                                                            ║");
            println!("  ║   1. Text: \"LDI r0, 20000\\nLOAD r0, r5\\n...\"              ║");
            println!("  ║   2. GPU assembler compiled text → 18-pixel bootloader    ║");
            println!("  ║   3. Bootloader copied 8 RISC-V instructions              ║");
            println!("  ║   4. RISC-V VM executed → UART: \"Hi\"                      ║");
            println!("  ║                                                            ║");
            println!("  ║   No CPU wrote program logic. Pixels compiled pixels.     ║");
            println!("  ║   Pixels moved pixels. Pixels booted a real ISA.          ║");
            println!("  ║                                                            ║");
            println!("  ╚════════════════════════════════════════════════════════════╝");
        } else {
            println!("  FAILED: expected \"Hi\\n\", got {:?}", output);
            println!("  Stats: {:?}", &stats[..std::cmp::min(16, stats.len())]);
        }
        println!();

        assert_eq!(output, "Hi\n", "RISC-V did not produce expected UART output");
    }
}
