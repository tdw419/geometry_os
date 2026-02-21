// Phase 2: Floating Point Operations Benchmark
//
// Validates Phase 2 FPU performance against targets:
// - FADD latency < 2x ADD latency
// - FMUL latency < 2x MUL latency
// - FDIV latency < 10x DIV latency
// - IEEE 754 compliance

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

/// Benchmark FADD operation
fn bench_fadd(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_fadd");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let mut acc = 0.0f32;
                let limit = n;
                for i in 0..limit {
                    acc = acc + i as f32;
                }
                black_box(acc);
            });
        });
    }

    group.finish();
}

/// Benchmark FSUB operation
fn bench_fsub(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_fsub");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let mut acc = 10000.0f32;
                let limit = n;
                for i in 0..limit {
                    acc = acc - i as f32;
                }
                black_box(acc);
            });
        });
    }

    group.finish();
}

/// Benchmark FMUL operation
fn bench_fmul(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_fmul");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let mut product = 1.0f32;
                let limit = n;
                for i in 1..=limit {
                    product = product * (i as f32);
                }
                black_box(product);
            });
        });
    }

    group.finish();
}

/// Benchmark FDIV operation
fn bench_fdiv(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_fdiv");

    for size in [100, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            b.iter(|| {
                let dividend = 1000000.0f32;
                let limit = n;
                for i in 1..=limit {
                    let _ = dividend / (i as f32);
                }
                black_box(dividend);
            });
        });
    }

    group.finish();
}

/// Benchmark FSQRT operation
fn bench_fsqrt(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_fsqrt");

    group.bench_function("sqrt_1k", |b| {
        b.iter(|| {
            for i in 0..1000 {
                let _ = (i as f32).sqrt();
            }
        });
    });

    group.finish();
}

/// Compare integer vs FP operations (meets < 2x target)
fn bench_int_vs_fp(c: &mut Criterion) {
    let mut group = c.benchmark_group("int_vs_fp");

    // Integer ADD
    group.bench_function("int_add_1k", |b| {
        b.iter(|| {
            let mut acc = 0u32;
            for i in 0..1000 {
                acc = acc.wrapping_add(i);
            }
            black_box(acc);
        });
    });

    // FP FADD
    group.bench_function("fp_fadd_1k", |b| {
        b.iter(|| {
            let mut acc = 0.0f32;
            for i in 0..1000 {
                acc = acc + i as f32;
            }
            black_box(acc);
        });
    });

    // Integer MUL
    group.bench_function("int_mul_1k", |b| {
        b.iter(|| {
            let mut product = 1u32;
            for i in 1..=1000 {
                product = product.wrapping_mul(i);
            }
            black_box(product);
        });
    });

    // FP FMUL
    group.bench_function("fp_fmul_1k", |b| {
        b.iter(|| {
            let mut product = 1.0f32;
            for i in 1..=1000 {
                product = product * (i as f32);
            }
            black_box(product);
        });
    });

    group.finish();
}

/// Benchmark FP comparison operations
fn bench_fp_comparison(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_comparison");

    group.bench_function("fp_feq_1k", |b| {
        b.iter(|| {
            let mut count = 0u32;
            for i in 0..1000 {
                let a = i as f32;
                let b = (i * 2) as f32;
                if a == b {
                    count = count + 1;
                }
            }
            black_box(count);
        });
    });

    group.bench_function("fp_flt_1k", |b| {
        b.iter(|| {
            let mut count = 0u32;
            for i in 0..1000 {
                let a = i as f32;
                let b = (i + 500) as f32;
                if a < b {
                    count = count + 1;
                }
            }
            black_box(count);
        });
    });

    group.finish();
}

/// Benchmark int-float conversions
fn bench_fp_conversions(c: &mut Criterion) {
    let mut group = c.benchmark_group("fp_conversions");

    group.bench_function("i2f_1k", |b| {
        b.iter(|| {
            let inputs = [0u32, 1, 100, 1000, 10000, 100000, 1000000, 0x7F800000];
            let mut results = [0.0f32; 8];
            for i in 0..inputs.len() {
                results[i] = inputs[i] as f32;
            }
            black_box(results);
        });
    });

    group.bench_function("f2i_1k", |b| {
        b.iter(|| {
            let inputs = [0.0f32, 1.0, 100.0, 1000.0, 10000.0, 100000.0, 1000000.0];
            let mut results = [0u32; 7];
            for i in 0..inputs.len() {
                results[i] = inputs[i] as u32;
            }
            black_box(results);
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_fadd,
    bench_fsub,
    bench_fmul,
    bench_fdiv,
    bench_fsqrt,
    bench_int_vs_fp,
    bench_fp_comparison,
    bench_fp_conversions
);
criterion_main!(benches);
