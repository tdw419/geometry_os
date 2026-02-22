// Phase 5: System Calls Benchmark
//
// Validates Phase 5 Syscall implementation performance:
// - ECALL: Environment call overhead at different scales
// - EBREAK: Breakpoint trap overhead
// - Syscall dispatch: Performance for different syscall numbers
// - Argument passing: Overhead of 6-argument syscalls
//
// Provides CPU baseline to compare against Phase 0.5 GPU benchmarks

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

// Import test utilities
use infinite_map_rs::tests::riscv_test_programs::RiscvEncoder;

// ============================================
// Mock CPU Executor for Benchmarking
// ============================================

/// Mock RISC-V CPU executor for system call performance benchmarking
/// Matches WGSL behavior from src/shaders/riscv_executor.wgsl
struct BenchCpu {
    /// General purpose registers x0-x31
    registers: [u32; 32],
    /// Program counter
    pc: u32,
    /// Instruction memory (indexed by PC >> 2)
    instructions: Vec<u32>,
    /// Halt flag
    halted: bool,
    /// Breakpoint hit flag
    breakpoint_hit: bool,
    /// Syscall handler mock
    syscall_handler: Option<Box<dyn SyscallHandler>>,
}

/// Syscall handler interface (mimics OS syscall table)
trait SyscallHandler {
    /// Handle system call, return value for a0
    fn handle_syscall(&mut self, number: u32, args: &[u32; 6]) -> u32;
}

/// Mock syscall handler for benchmarking
struct MockSyscallHandler {
    return_values: std::collections::HashMap<u32, u32>,
}

impl MockSyscallHandler {
    fn new() -> Self {
        let mut return_values = std::collections::HashMap::new();
        // Standard Linux syscalls (for reference)
        return_values.insert(1, 0); // write: bytes written
        return_values.insert(60, 0); // exit: exit code
        return_values.insert(64, 0); // read: bytes read
        return_values.insert(93, 42); // exit_group: mock return
        return_values.insert(221, 0); // Pipe: mock return
        Self { return_values }
    }
}

impl SyscallHandler for MockSyscallHandler {
    fn handle_syscall(&mut self, number: u32, _args: &[u32; 6]) -> u32 {
        *self.return_values.get(&number).unwrap_or(&0xFFFFFFFF)
    }
}

impl BenchCpu {
    /// Create a new benchmark CPU executor
    fn new() -> Self {
        Self {
            registers: [0u32; 32],
            pc: 0,
            instructions: Vec::new(),
            halted: false,
            breakpoint_hit: false,
            syscall_handler: Some(Box::new(MockSyscallHandler::new())),
        }
    }

    /// Load a program into instruction memory
    fn load_program(&mut self, code: &[u32]) {
        self.instructions = code.to_vec();
        self.pc = 0;
        self.halted = false;
        self.breakpoint_hit = false;
    }

    /// Read a register value (x0 is always 0)
    #[inline]
    fn get_reg(&self, reg: u32) -> u32 {
        if reg == 0 {
            0
        } else if reg < 32 {
            self.registers[reg as usize]
        } else {
            0
        }
    }

    /// Set a register value (x0 is read-only)
    #[inline]
    fn set_reg(&mut self, reg: u32, val: u32) {
        if reg != 0 && reg < 32 {
            self.registers[reg as usize] = val;
        }
    }

    /// Fetch instruction from memory
    #[inline]
    fn fetch(&self, addr: u32) -> u32 {
        let idx = (addr >> 2) as usize;
        if idx < self.instructions.len() {
            self.instructions[idx]
        } else {
            0
        }
    }

    /// Decode instruction fields
    #[inline]
    fn decode_opcode(inst: u32) -> u32 {
        inst & 0x7F
    }

    #[inline]
    fn decode_rd(inst: u32) -> u32 {
        (inst >> 7) & 0x1F
    }

    #[inline]
    fn decode_funct3(inst: u32) -> u32 {
        (inst >> 12) & 0x7
    }

    #[inline]
    fn decode_rs1(inst: u32) -> u32 {
        (inst >> 15) & 0x1F
    }

    #[inline]
    fn decode_imm_i(inst: u32) -> i32 {
        let imm = ((inst >> 20) & 0xFFF) as i32;
        if (imm & 0x800) != 0 {
            imm | 0xFFFFF000u32 as i32
        } else {
            imm
        }
    }

    /// Execute instruction at PC
    #[inline]
    fn step(&mut self) -> bool {
        if self.halted {
            return false;
        }

        let inst = self.fetch(self.pc);
        let opcode = Self::decode_opcode(inst);
        let rd = Self::decode_rd(inst);
        let rs1 = Self::decode_rs1(inst);
        let funct3 = Self::decode_funct3(inst);

        match opcode {
            0x13 => {
                // OP_IMM (ADDI for setup)
                let imm = Self::decode_imm_i(inst);
                self.set_reg(rd, self.get_reg(rs1).wrapping_add(imm as u32));
                self.pc += 4;
            }
            0x73 => {
                // SYSTEM (ECALL/EBREAK)
                if funct3 == 0 {
                    if inst == 0x00000073 {
                        // ECALL
                        self.handle_ecall();
                        self.pc += 4;
                    } else if inst == 0x00100073 {
                        // EBREAK
                        self.breakpoint_hit = true;
                        self.halted = true;
                    }
                }
            }
            _ => {
                self.pc += 4;
            }
        }

        !self.halted
    }

    /// Handle ECALL system call
    #[inline]
    fn handle_ecall(&mut self) {
        // Syscall number in a7 (x17)
        let syscall_num = self.get_reg(17);

        // Arguments in a0-a5 (x10-x15)
        let args = [
            self.get_reg(10), // a0
            self.get_reg(11), // a1
            self.get_reg(12), // a2
            self.get_reg(13), // a3
            self.get_reg(14), // a4
            self.get_reg(15), // a5
        ];

        let ret = match &mut self.syscall_handler {
            Some(handler) => handler.handle_syscall(syscall_num, &args),
            None => 0,
        };

        // Return value in a0 (x10)
        self.set_reg(10, ret);
    }

    /// Run all instructions
    fn run(&mut self) {
        while self.step() {
            // Continue until halt
        }
    }
}

// ============================================
// ECALL Overhead Benchmarks
// ============================================

/// Benchmark ECALL overhead at different scales
fn bench_ecall_overhead(c: &mut Criterion) {
    let mut group = c.benchmark_group("syscall_ecall_overhead");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &size| {
            // Create ECALL instruction sequence
            let mut e = RiscvEncoder::new();
            for _ in 0..size {
                e.addi(17, 0, 1); // a7 = 1 (write syscall)
                e.ecall(); // System call
            }

            let code: Vec<u32> = e
                .finalize()
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = BenchCpu::new();
                cpu.load_program(&code);
                black_box(cpu.run());
            });
        });
    }

    group.finish();
}

/// Benchmark EBREAK overhead at different scales
fn bench_ebreak_overhead(c: &mut Criterion) {
    let mut group = c.benchmark_group("syscall_ebreak_overhead");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &size| {
            // Create EBREAK instruction sequence
            let mut e = RiscvEncoder::new();
            for _ in 0..size {
                e.addi(1, 0, 42); // x1 = 42 (setup before breakpoint)
                e.ebreak(); // Breakpoint (halts)
            }

            let code: Vec<u32> = e
                .finalize()
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = BenchCpu::new();
                cpu.load_program(&code);
                black_box(cpu.run());
            });
        });
    }

    group.finish();
}

// ============================================
// Syscall Dispatch Benchmarks
// ============================================

/// Benchmark syscall dispatch for different syscall numbers
fn bench_syscall_dispatch(c: &mut Criterion) {
    let mut group = c.benchmark_group("syscall_dispatch");

    // Benchmark different syscall numbers (simulating OS dispatch)
    for syscall_num in [1u32, 60, 64, 93, 221].iter() {
        group.bench_with_input(
            BenchmarkId::new("syscall", syscall_num),
            syscall_num,
            |b, &syscall_num| {
                let mut e = RiscvEncoder::new();
                for _ in 0..1000 {
                    e.addi(17, 0, syscall_num as i32); // a7 = syscall number
                    e.ecall();
                }

                let code: Vec<u32> = e
                    .finalize()
                    .chunks(4)
                    .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                    .collect();

                b.iter(|| {
                    let mut cpu = BenchCpu::new();
                    cpu.load_program(&code);
                    black_box(cpu.run());
                });
            },
        );
    }

    group.finish();
}

// ============================================
// Argument Passing Benchmarks
// ============================================

/// Benchmark syscall with varying argument counts
fn bench_syscall_arguments(c: &mut Criterion) {
    let mut group = c.benchmark_group("syscall_arguments");

    // Benchmark with 0 arguments (just syscall number)
    group.bench_function("0_args_1k", |b| {
        let mut e = RiscvEncoder::new();
        for _ in 0..1000 {
            e.addi(17, 0, 60); // a7 = 60 (exit)
            e.ecall();
        }

        let code: Vec<u32> = e
            .finalize()
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = BenchCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // Benchmark with 3 arguments (typical syscall)
    group.bench_function("3_args_1k", |b| {
        let mut e = RiscvEncoder::new();
        for _ in 0..1000 {
            e.addi(17, 0, 64); // a7 = 64 (read)
            e.addi(10, 0, 1); // a0 = fd
            e.addi(11, 0, 2); // a1 = buf
            e.addi(12, 0, 3); // a2 = count
            e.ecall();
        }

        let code: Vec<u32> = e
            .finalize()
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = BenchCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // Benchmark with 6 arguments (maximum standard arguments)
    group.bench_function("6_args_1k", |b| {
        let mut e = RiscvEncoder::new();
        for _ in 0..1000 {
            e.addi(17, 0, 221); // a7 = 221 (pipe2 or similar)
            e.addi(10, 0, 1); // a0
            e.addi(11, 0, 2); // a1
            e.addi(12, 0, 3); // a2
            e.addi(13, 0, 4); // a3
            e.addi(14, 0, 5); // a4
            e.addi(15, 0, 6); // a5
            e.ecall();
        }

        let code: Vec<u32> = e
            .finalize()
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = BenchCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Comparison Benchmarks
// ============================================

/// Compare ECALL vs regular instruction overhead
fn bench_ecall_vs_regular(c: &mut Criterion) {
    let mut group = c.benchmark_group("syscall_vs_regular");

    // Regular ADDI instructions
    group.bench_function("addi_1k", |b| {
        let mut e = RiscvEncoder::new();
        for _ in 0..1000 {
            e.addi(1, 0, 42); // Regular ALU instruction
        }

        let code: Vec<u32> = e
            .finalize()
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = BenchCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    // ECALL instructions
    group.bench_function("ecall_1k", |b| {
        let mut e = RiscvEncoder::new();
        for _ in 0..1000 {
            e.addi(17, 0, 1); // Setup syscall number
            e.ecall();
        }

        let code: Vec<u32> = e
            .finalize()
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = BenchCpu::new();
            cpu.load_program(&code);
            black_box(cpu.run());
        });
    });

    group.finish();
}

// ============================================
// Benchmark Groups
// ============================================

criterion_group!(
    benches,
    bench_ecall_overhead,
    bench_ebreak_overhead,
    bench_syscall_dispatch,
    bench_syscall_arguments,
    bench_ecall_vs_regular
);
criterion_main!(benches);
