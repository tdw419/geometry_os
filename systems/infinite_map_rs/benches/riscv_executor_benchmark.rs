// RISC-V Executor Comprehensive Benchmark
//
// Benchmarks all RISC-V instruction categories:
// - Integer arithmetic (ADD, SUB, MUL, etc.)
// - Logical operations (AND, OR, XOR, etc.)
// - Memory operations (LB, LH, LW, SB, SH, SW)
// - Branch instructions (BEQ, BNE, BLT, etc.)
// - System calls (ECALL, EBREAK)
// - Floating point (if available)
//
// Provides baseline for GPU executor comparison

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

/// Mock RISC-V CPU for benchmarking
struct MockCpu {
    /// General purpose registers x0-x31
    regs: [u32; 32],
    /// Program counter
    pc: u32,
    /// Memory (1MB)
    mem: Vec<u8>,
    /// Instruction memory
    instructions: Vec<u32>,
    /// Halted flag
    halted: bool,
}

impl MockCpu {
    fn new() -> Self {
        Self {
            regs: [0u32; 32],
            pc: 0,
            mem: vec![0u8; 1024 * 1024],
            instructions: Vec::new(),
            halted: false,
        }
    }

    fn load_program(&mut self, code: &[u32]) {
        self.instructions = code.to_vec();
        self.pc = 0;
        self.halted = false;
        self.regs = [0u32; 32];
    }

    #[inline]
    fn get_reg(&self, reg: u32) -> u32 {
        if reg == 0 { 0 } else { self.regs[reg as usize] }
    }

    #[inline]
    fn set_reg(&mut self, reg: u32, val: u32) {
        if reg != 0 && reg < 32 {
            self.regs[reg as usize] = val;
        }
    }

    #[inline]
    fn fetch(&self) -> u32 {
        let idx = (self.pc >> 2) as usize;
        self.instructions.get(idx).copied().unwrap_or(0)
    }

    fn step(&mut self) -> bool {
        if self.halted {
            return false;
        }

        let inst = self.fetch();
        let opcode = inst & 0x7F;
        let rd = (inst >> 7) & 0x1F;
        let funct3 = (inst >> 12) & 0x7;
        let rs1 = (inst >> 15) & 0x1F;
        let rs2 = (inst >> 20) & 0x1F;
        let funct7 = (inst >> 25) & 0x7F;

        match opcode {
            0x13 => {
                // OP-IMM
                let imm = ((inst >> 20) as i32) << 20 >> 20; // Sign extend
                let src = self.get_reg(rs1);
                let result = match funct3 {
                    0 => src.wrapping_add(imm as u32), // ADDI
                    2 => if (src as i32) < imm { 1 } else { 0 }, // SLTI
                    3 => if src < (imm as u32) { 1 } else { 0 }, // SLTIU
                    4 => src ^ (imm as u32), // XORI
                    6 => src | (imm as u32), // ORI
                    7 => src & (imm as u32), // ANDI
                    1 => src << (imm as u32 & 0x1F), // SLLI
                    5 => if (imm as u32) & 0x400 != 0 {
                        (src as i32 >> (imm as u32 & 0x1F)) as u32 // SRAI
                    } else {
                        src >> (imm as u32 & 0x1F) // SRLI
                    },
                    _ => 0,
                };
                self.set_reg(rd, result);
                self.pc += 4;
            }
            0x33 => {
                // OP (R-type)
                let src1 = self.get_reg(rs1);
                let src2 = self.get_reg(rs2);
                let result = match funct3 {
                    0 => if funct7 == 0x20 {
                        src1.wrapping_sub(src2) // SUB
                    } else {
                        src1.wrapping_add(src2) // ADD
                    },
                    1 => src1 << (src2 & 0x1F), // SLL
                    2 => if (src1 as i32) < (src2 as i32) { 1 } else { 0 }, // SLT
                    3 => if src1 < src2 { 1 } else { 0 }, // SLTU
                    4 => src1 ^ src2, // XOR
                    5 => if funct7 == 0x20 {
                        ((src1 as i32) >> (src2 as i32 & 0x1F)) as u32 // SRA
                    } else {
                        src1 >> (src2 & 0x1F) // SRL
                    },
                    6 => src1 | src2, // OR
                    7 => src1 & src2, // AND
                    _ => 0,
                };
                self.set_reg(rd, result);
                self.pc += 4;
            }
            0x03 => {
                // LOAD
                let addr = self.get_reg(rs1).wrapping_add((inst >> 20) as i32 as u32);
                let val = match funct3 {
                    0 => self.mem[addr as usize] as u32, // LB
                    1 => u16::from_le_bytes([self.mem[addr as usize], self.mem[addr as usize + 1]]) as u32, // LH
                    2 => u32::from_le_bytes([
                        self.mem[addr as usize],
                        self.mem[addr as usize + 1],
                        self.mem[addr as usize + 2],
                        self.mem[addr as usize + 3],
                    ]), // LW
                    4 => self.mem[addr as usize] as u32, // LBU
                    5 => u16::from_le_bytes([self.mem[addr as usize], self.mem[addr as usize + 1]]) as u32, // LHU
                    _ => 0,
                };
                self.set_reg(rd, val);
                self.pc += 4;
            }
            0x23 => {
                // STORE
                let addr = self.get_reg(rs1).wrapping_add(((inst >> 20) as i32 >> 7) as u32);
                let val = self.get_reg(rs2);
                match funct3 {
                    0 => self.mem[addr as usize] = val as u8, // SB
                    1 => {
                        let bytes = (val as u16).to_le_bytes();
                        self.mem[addr as usize] = bytes[0];
                        self.mem[addr as usize + 1] = bytes[1];
                    }, // SH
                    2 => {
                        let bytes = val.to_le_bytes();
                        self.mem[addr as usize..addr as usize + 4].copy_from_slice(&bytes);
                    }, // SW
                    _ => {}
                };
                self.pc += 4;
            }
            0x63 => {
                // BRANCH
                let src1 = self.get_reg(rs1);
                let src2 = self.get_reg(rs2);
                let imm = (((inst >> 8) & 0xF) << 1
                    | ((inst >> 25) & 0x3F) << 5
                    | ((inst >> 7) & 0x1) << 11
                    | ((inst >> 31) & 0x1) << 12) as i32;
                let imm = (imm << 20) >> 20; // Sign extend

                let take = match funct3 {
                    0 => src1 == src2, // BEQ
                    1 => src1 != src2, // BNE
                    4 => src1 < src2, // BLT
                    5 => src1 >= src2, // BGE
                    6 => (src1 as i32) < (src2 as i32), // BLTU
                    7 => (src1 as i32) >= (src2 as i32), // BGEU
                    _ => false,
                };

                if take {
                    self.pc = (self.pc as i32 + imm) as u32;
                } else {
                    self.pc += 4;
                }
            }
            0x67 => {
                // JAL
                self.set_reg(rd, self.pc + 4);
                let imm = (((inst >> 21) & 0x3FF) << 1
                    | ((inst >> 20) & 0x1) << 11
                    | ((inst >> 12) & 0xFF) << 12
                    | ((inst >> 31) & 0x1) << 20) as i32;
                let imm = (imm << 11) >> 11;
                self.pc = (self.pc as i32 + imm) as u32;
            }
            0x6F => {
                // JALR
                let target = self.get_reg(rs1).wrapping_add((((inst >> 20) as i32) << 20 >> 20) as u32) & !1;
                self.set_reg(rd, self.pc + 4);
                self.pc = target;
            }
            0x37 => {
                // LUI
                let imm = inst & 0xFFFFF000;
                self.set_reg(rd, imm);
                self.pc += 4;
            }
            0x17 => {
                // AUIPC
                let imm = inst & 0xFFFFF000;
                self.set_reg(rd, self.pc.wrapping_add(imm));
                self.pc += 4;
            }
            0x73 => {
                // SYSTEM (ECALL/EBREAK)
                if funct3 == 0 {
                    if inst == 0x00000073 {
                        // ECALL - mock syscall
                        self.set_reg(10, 0); // Return 0 in a0
                    } else if inst == 0x00100073 {
                        // EBREAK - halt
                        self.halted = true;
                    }
                }
                self.pc += 4;
            }
            _ => {
                self.pc += 4;
            }
        }

        !self.halted
    }

    fn run(&mut self) {
        while self.step() {}
    }
}

// ============================================
// Integer Arithmetic Benchmarks
// ============================================

fn bench_integer_arithmetic(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_integer");

    // ADD instructions
    group.bench_function("add_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let rs1 = ((i + 1) % 31) + 1;
            let rs2 = ((i + 2) % 31) + 1;
            // ADD rd, rs1, rs2 (funct3 = 0 for ADD)
            code.push((rd << 7) | (0 << 12) | (rs1 << 15) | (rs2 << 20) | 0x33);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // SUB instructions
    group.bench_function("sub_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let rs1 = ((i + 1) % 31) + 1;
            let rs2 = ((i + 2) % 31) + 1;
            // SUB rd, rs1, rs2 (funct7 = 0x20)
            code.push((rd << 7) | (0 << 12) | (rs1 << 15) | (rs2 << 20) | (0x20 << 25) | 0x33);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // ADDI instructions
    group.bench_function("addi_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let rs1 = ((i + 1) % 31) + 1;
            let imm = (i as i32) << 20 >> 20; // Sign extend
            // ADDI rd, rs1, imm
            code.push((rd << 7) | (0 << 12) | (rs1 << 15) | ((imm as u32) & 0xFFF) << 20 | 0x13);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Logical Operations Benchmarks
// ============================================

fn bench_logical_ops(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_logical");

    // AND
    group.bench_function("and_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let rs1 = ((i + 1) % 31) + 1;
            let rs2 = ((i + 2) % 31) + 1;
            code.push((rd << 7) | (7 << 12) | (rs1 << 15) | (rs2 << 20) | 0x33);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // OR
    group.bench_function("or_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let rs1 = ((i + 1) % 31) + 1;
            let rs2 = ((i + 2) % 31) + 1;
            code.push((rd << 7) | (6 << 12) | (rs1 << 15) | (rs2 << 20) | 0x33);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // XOR
    group.bench_function("xor_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let rs1 = ((i + 1) % 31) + 1;
            let rs2 = ((i + 2) % 31) + 1;
            code.push((rd << 7) | (4 << 12) | (rs1 << 15) | (rs2 << 20) | 0x33);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Memory Operations Benchmarks
// ============================================

fn bench_memory_ops(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_memory");

    // LW (load word)
    group.bench_function("lw_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let rd = (i % 31) + 1;
            let offset = (i % 256) * 4;
            // LW rd, offset(x0)
            code.push((rd << 7) | (2 << 12) | (0 << 15) | (offset << 20) | 0x03);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // SW (store word)
    group.bench_function("sw_1k", |b| {
        let mut code = Vec::new();
        for i in 0..1000u32 {
            let src = ((i % 31) + 1) as u32;
            let offset = (i % 256) * 4;
            // SW src, offset(x0)
            code.push((offset & 0x1F) << 7 | (2 << 12) | (0 << 15) | (src << 20) | 0x23);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // Mixed load/store
    group.bench_function("mixed_ls_1k", |b| {
        let mut code = Vec::new();
        for i in 0..500u32 {
            let rd = (i % 31) + 1;
            let offset = (i % 256) * 4;
            // LW
            code.push((rd << 7) | (2 << 12) | (0 << 15) | (offset << 20) | 0x03);
            // SW
            code.push((offset & 0x1F) << 7 | (2 << 12) | (0 << 15) | (rd << 20) | 0x23);
        }
        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Branch Operations Benchmarks
// ============================================

fn bench_branch_ops(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_branch");

    // BEQ (branch equal)
    group.bench_function("beq_taken_1k", |b| {
        let mut code = Vec::new();
        // Setup: make x1 == x2
        code.push((1 << 7) | (0 << 12) | (0 << 15) | (42 << 20) | 0x13); // addi x1, x0, 42
        code.push((2 << 7) | (0 << 12) | (0 << 15) | (42 << 20) | 0x13); // addi x2, x0, 42
        // Loop: BEQ x1, x2, -4 (back to self) - will be taken
        for _ in 0..998 {
            code.push((0 << 7) | (0 << 12) | (1 << 15) | (2 << 20) | (0x3F << 25) | 0x63); // beq x1, x2, -4
        }
        code.push(0x00100073); // EBREAK to stop

        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // BNE (branch not equal)
    group.bench_function("bne_not_taken_1k", |b| {
        let mut code = Vec::new();
        // Setup: make x1 != x2
        code.push((1 << 7) | (0 << 12) | (0 << 15) | (42 << 20) | 0x13); // addi x1, x0, 42
        code.push((2 << 7) | (0 << 12) | (0 << 15) | (43 << 20) | 0x13); // addi x2, x0, 43
        // BNE x1, x2, target - will be taken
        for i in 0..998 {
            let offset = if i < 997 { 0 } else { 4 }; // Last one jumps to EBREAK
            code.push((offset << 8) | (1 << 12) | (1 << 15) | (2 << 20) | 0x63);
        }
        code.push(0x00100073); // EBREAK

        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Mixed Workload Benchmarks
// ============================================

fn bench_mixed_workload(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_mixed");

    // Fibonacci calculation
    group.bench_function("fibonacci_20", |b| {
        // Calculate fib(20) = 6765
        // a0 = 0, a1 = 1
        // loop: a2 = a0 + a1; a0 = a1; a1 = a2; counter--; if counter > 0 goto loop
        let code = vec![
            0x01300013, // addi x0, x0, 0 (nop)
            (10 << 7) | (0 << 12) | (0 << 15) | (0 << 20) | 0x13,   // addi a0, x0, 0
            (11 << 7) | (0 << 12) | (0 << 15) | (1 << 20) | 0x13,   // addi a1, x0, 1
            (12 << 7) | (0 << 12) | (0 << 15) | (20 << 20) | 0x13,  // addi a2, x0, 20 (counter)
            // loop:
            (13 << 7) | (0 << 12) | (10 << 15) | (11 << 20) | 0x33, // add a3, a0, a1
            (10 << 7) | (0 << 12) | (11 << 15) | (0 << 20) | 0x33,  // add a0, a1, x0
            (11 << 7) | (0 << 12) | (13 << 15) | (0 << 20) | 0x33,  // add a1, a3, x0
            (12 << 7) | (0 << 12) | (12 << 15) | ((-1i32 as u32) & 0xFFF) << 20 | 0x13, // addi a2, a2, -1
            // bne a2, x0, loop (offset = -16 = 0xFFF0)
            (0xFF0 << 20) | (1 << 12) | (12 << 15) | (0 << 20) | 0x63,
            0x00100073, // EBREAK
        ];

        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // Memory copy
    group.bench_function("memcpy_1kb", |b| {
        let mut code = vec![
            // Setup: a0 = src, a1 = dst, a2 = count
            (10 << 7) | (0 << 12) | (0 << 15) | (0 << 20) | 0x13,   // addi a0, x0, 0
            (11 << 7) | (0 << 12) | (0 << 15) | (4096 << 20) | 0x13, // addi a1, x0, 4096
            (12 << 7) | (0 << 12) | (0 << 15) | (256 << 20) | 0x13,  // addi a2, x0, 256 (words)
        ];

        // loop: lw a3, 0(a0); sw a3, 0(a1); addi a0, a0, 4; addi a1, a1, 4; addi a2, a2, -1; bne a2, x0, loop
        code.push((13 << 7) | (2 << 12) | (10 << 15) | (0 << 20) | 0x03); // lw a3, 0(a0)
        code.push((0 << 7) | (2 << 12) | (11 << 15) | (13 << 20) | 0x23); // sw a3, 0(a1)
        code.push((10 << 7) | (0 << 12) | (10 << 15) | (4 << 20) | 0x13); // addi a0, a0, 4
        code.push((11 << 7) | (0 << 12) | (11 << 15) | (4 << 20) | 0x13); // addi a1, a1, 4
        code.push((12 << 7) | (0 << 12) | (12 << 15) | (0xFFF << 20) | 0x13); // addi a2, a2, -1
        // bne a2, x0, -20
        code.push((0xFEC << 20) | (1 << 12) | (12 << 15) | (0 << 20) | 0x63);
        code.push(0x00100073); // EBREAK

        b.iter(|| {
            let mut cpu = MockCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Throughput Benchmarks
// ============================================

fn bench_instruction_throughput(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_throughput");

    for count in [1000u32, 10000, 100000].iter() {
        group.throughput(Throughput::Elements(*count as u64));
        group.bench_with_input(BenchmarkId::new("instructions", count), count, |b, &count| {
            let code: Vec<u32> = (0..count)
                .map(|i| {
                    let rd = (i % 31) + 1;
                    (rd << 7) | (0 << 12) | (0 << 15) | ((i % 1000) << 20) | 0x13
                })
                .collect();

            b.iter(|| {
                let mut cpu = MockCpu::new();
                cpu.load_program(&code);
                black_box(cpu.run());
            });
        });
    }

    group.finish();
}

criterion_group!(
    benches,
    bench_integer_arithmetic,
    bench_logical_ops,
    bench_memory_ops,
    bench_branch_ops,
    bench_mixed_workload,
    bench_instruction_throughput,
);
criterion_main!(benches);
