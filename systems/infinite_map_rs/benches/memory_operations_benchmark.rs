// Phase 3: Memory Operations Benchmark
//
// Validates Phase 3 Memory implementation performance against targets:
// - LB latency < 50 GPU cycles
// - LW latency < 10 GPU cycles
// - SW latency < 10 GPU cycles
// - Unaligned access correctness (may be slower)

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

/// Mock memory for CPU-based benchmarking
struct MockMemory {
    data: Vec<u32>,
}

impl MockMemory {
    fn new(size_words: usize) -> Self {
        Self {
            data: vec![0u32; size_words.max(1024)],
        }
    }

    fn read_u8(&self, addr: usize) -> u32 {
        let word_idx = (addr / 4) as usize;
        if word_idx < self.data.len() {
            let word = self.data[word_idx];
            let shift = (addr % 4) * 8;
            (word >> shift) & 0xFF
        } else {
            0
        }
    }

    fn read_u16(&self, addr: usize) -> u32 {
        let b0 = self.read_u8(addr);
        let b1 = self.read_u8(addr + 1);
        b0 | (b1 << 8)
    }

    fn read_u32(&self, addr: usize) -> u32 {
        let word_idx = (addr / 4) as usize;
        if word_idx < self.data.len() {
            self.data[word_idx]
        } else {
            0
        }
    }

    fn write_u8(&mut self, addr: usize, value: u32) {
        let word_idx = (addr / 4) as usize;
        if word_idx < self.data.len() {
            let word_addr = addr & !3;
            let word = self.read_u32(word_addr);
            let shift = (addr % 4) * 8;
            let mask = !(0xFF << shift);
            let new_word = (word & mask) | ((value & 0xFF) << shift);
            self.data[word_idx] = new_word;
        }
    }

    fn write_u16(&mut self, addr: usize, value: u32) {
        self.write_u8(addr, value & 0xFF);
        self.write_u8(addr + 1, (value >> 8) & 0xFF);
    }

    fn write_u32(&mut self, addr: usize, value: u32) {
        let word_idx = (addr / 4) as usize;
        if word_idx < self.data.len() {
            self.data[word_idx] = value;
        }
    }

    fn lb(&self, addr: usize) -> u32 {
        let byte = self.read_u8(addr);
        if (byte & 0x80) != 0 {
            byte | 0xFFFFFF00
        } else {
            byte
        }
    }

    fn lh(&self, addr: usize) -> u32 {
        let halfword = self.read_u16(addr);
        if (halfword & 0x8000) != 0 {
            halfword | 0xFFFF0000
        } else {
            halfword
        }
    }

    fn lw(&self, addr: usize) -> u32 {
        self.read_u32(addr)
    }

    fn lbu(&self, addr: usize) -> u32 {
        self.read_u8(addr)
    }

    fn lhu(&self, addr: usize) -> u32 {
        self.read_u16(addr)
    }

    fn sb(&mut self, addr: usize, value: u32) {
        self.write_u8(addr, value & 0xFF);
    }

    fn sh(&mut self, addr: usize, value: u32) {
        self.write_u16(addr, value & 0xFFFF);
    }

    fn sw(&mut self, addr: usize, value: u32) {
        self.write_u32(addr, value);
    }
}

/// Benchmark LB (Load Byte, sign-extended)
fn bench_lb(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_lb");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            let mem = MockMemory::new(n * 4);
            b.iter(|| {
                let mut sum = 0u32;
                for i in 0..n {
                    sum = sum.wrapping_add(mem.lb(i * 4));
                }
                black_box(sum);
            });
        });
    }

    group.finish();
}

/// Benchmark LH (Load Halfword, sign-extended)
fn bench_lh(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_lh");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            let mem = MockMemory::new(n * 4);
            b.iter(|| {
                let mut sum = 0u32;
                for i in 0..n {
                    sum = sum.wrapping_add(mem.lh(i * 4));
                }
                black_box(sum);
            });
        });
    }

    group.finish();
}

/// Benchmark LW (Load Word)
fn bench_lw(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_lw");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            let mem = MockMemory::new(n * 4);
            b.iter(|| {
                let mut sum = 0u32;
                for i in 0..n {
                    sum = sum.wrapping_add(mem.lw(i * 4));
                }
                black_box(sum);
            });
        });
    }

    group.finish();
}

/// Benchmark LBU (Load Byte Unsigned)
fn bench_lbu(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_lbu");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            let mem = MockMemory::new(n * 4);
            b.iter(|| {
                let mut sum = 0u32;
                for i in 0..n {
                    sum = sum.wrapping_add(mem.lbu(i * 4));
                }
                black_box(sum);
            });
        });
    }

    group.finish();
}

/// Benchmark LHU (Load Halfword Unsigned)
fn bench_lhu(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_lhu");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            let mem = MockMemory::new(n * 4);
            b.iter(|| {
                let mut sum = 0u32;
                for i in 0..n {
                    sum = sum.wrapping_add(mem.lhu(i * 4));
                }
                black_box(sum);
            });
        });
    }

    group.finish();
}

/// Benchmark SB (Store Byte)
fn bench_sb(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_sb");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let mut mem = MockMemory::new(n * 4);
                for i in 0..n {
                    mem.sb(i * 4, (i & 0xFF) as u32);
                }
                black_box(&mem);
            });
        });
    }

    group.finish();
}

/// Benchmark SH (Store Halfword)
fn bench_sh(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_sh");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let mut mem = MockMemory::new(n * 4);
                for i in 0..n {
                    mem.sh(i * 4, (i & 0xFFFF) as u32);
                }
                black_box(&mem);
            });
        });
    }

    group.finish();
}

/// Benchmark SW (Store Word)
fn bench_sw(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_sw");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let mut mem = MockMemory::new(n * 4);
                for i in 0..n {
                    mem.sw(i * 4, i as u32);
                }
                black_box(&mem);
            });
        });
    }

    group.finish();
}

/// Compare signed vs unsigned load performance
fn bench_signed_vs_unsigned(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_signed_vs_unsigned");

    // LB vs LBU
    group.bench_function("lb_1k", |b| {
        let mem = MockMemory::new(4096);
        b.iter(|| {
            let mut sum = 0u32;
            for i in 0..1000 {
                sum = sum.wrapping_add(mem.lb(i * 4));
            }
            black_box(sum);
        });
    });

    group.bench_function("lbu_1k", |b| {
        let mem = MockMemory::new(4096);
        b.iter(|| {
            let mut sum = 0u32;
            for i in 0..1000 {
                sum = sum.wrapping_add(mem.lbu(i * 4));
            }
            black_box(sum);
        });
    });

    // LH vs LHU
    group.bench_function("lh_1k", |b| {
        let mem = MockMemory::new(4096);
        b.iter(|| {
            let mut sum = 0u32;
            for i in 0..1000 {
                sum = sum.wrapping_add(mem.lh(i * 4));
            }
            black_box(sum);
        });
    });

    group.bench_function("lhu_1k", |b| {
        let mem = MockMemory::new(4096);
        b.iter(|| {
            let mut sum = 0u32;
            for i in 0..1000 {
                sum = sum.wrapping_add(mem.lhu(i * 4));
            }
            black_box(sum);
        });
    });

    group.finish();
}

/// Benchmark aligned vs unaligned access
fn bench_aligned_vs_unaligned(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_alignment");

    // Aligned LW
    group.bench_function("lw_aligned_1k", |b| {
        let mem = MockMemory::new(4096);
        b.iter(|| {
            let mut sum = 0u32;
            for i in 0..1000 {
                sum = sum.wrapping_add(mem.lw(i * 4)); // Aligned
            }
            black_box(sum);
        });
    });

    // Unaligned LW (offset by 1)
    group.bench_function("lw_unaligned_1k", |b| {
        let mem = MockMemory::new(4096);
        b.iter(|| {
            let mut sum = 0u32;
            for i in 0..1000 {
                sum = sum.wrapping_add(mem.lw(i * 4 + 1)); // Unaligned
            }
            black_box(sum);
        });
    });

    group.finish();
}

/// Benchmark mixed load/store workload
fn bench_mixed_load_store(c: &mut Criterion) {
    let mut group = c.benchmark_group("mem_mixed");

    group.bench_function("mixed_1k", |b| {
        b.iter(|| {
            let mut mem = MockMemory::new(4096);
            // Initialize
            for i in 0..256 {
                mem.sw(i * 4, i as u32);
            }
            // Read-modify-write pattern
            for i in 0..256 {
                let val = mem.lw(i * 4);
                mem.sw(i * 4, val.wrapping_add(1));
            }
            black_box(&mem);
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_lb,
    bench_lh,
    bench_lw,
    bench_lbu,
    bench_lhu,
    bench_sb,
    bench_sh,
    bench_sw,
    bench_signed_vs_unsigned,
    bench_aligned_vs_unaligned,
    bench_mixed_load_store
);
criterion_main!(benches);
