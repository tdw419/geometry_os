// Hilbert Curve Performance Benchmark
//
// Benchmarks the Hilbert curve spatial mapping operations:
// - d2xy: Convert Hilbert index to (x, y) coordinates
// - xy2d: Convert (x, y) coordinates to Hilbert index
// - Batch transformations for RTS textures
//
// Target: <100ns per transformation

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

/// Rotate/flip quadrant appropriately
fn rot(n: u32, x: &mut u32, y: &mut u32, rx: u32, ry: u32) {
    if ry == 0 {
        if rx == 1 {
            *x = n - 1 - *x;
            *y = n - 1 - *y;
        }
        std::mem::swap(x, y);
    }
}

/// Convert Hilbert index to (x, y) coordinates
/// From Wikipedia: https://en.wikipedia.org/wiki/Hilbert_curve
fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut d = d;

    while s < n {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);
        rot(s, &mut x, &mut y, rx, ry);
        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }

    (x, y)
}

/// Convert (x, y) coordinates to Hilbert index
fn hilbert_xy2d(n: u32, x: u32, y: u32) -> u32 {
    let mut d = 0u32;
    let mut s = n / 2;
    let mut x = x;
    let mut y = y;

    while s > 0 {
        let rx = if (x & s) > 0 { 1u32 } else { 0u32 };
        let ry = if (y & s) > 0 { 1u32 } else { 0u32 };
        d += s * s * ((3 * rx) ^ ry);
        rot(s, &mut x, &mut y, rx, ry);
        s /= 2;
    }

    d
}

/// Batch convert indices to coordinates (for texture mapping)
fn hilbert_batch_d2xy(n: u32, indices: &[u32]) -> Vec<(u32, u32)> {
    indices.iter().map(|&d| hilbert_d2xy(n, d)).collect()
}

/// Batch convert coordinates to indices (for texture mapping)
fn hilbert_batch_xy2d(n: u32, coords: &[(u32, u32)]) -> Vec<u32> {
    coords.iter().map(|&(x, y)| hilbert_xy2d(n, x, y)).collect()
}

// ============================================
// Single Operation Benchmarks
// ============================================

fn bench_d2xy_single(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_d2xy");

    for n in [64u32, 256, 1024, 4096].iter() {
        group.bench_with_input(BenchmarkId::new("n", n), n, |b, &n| {
            let max_d = n * n;
            b.iter(|| {
                for d in 0..1000 {
                    black_box(hilbert_d2xy(n, d % max_d));
                }
            });
        });
    }

    group.finish();
}

fn bench_xy2d_single(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_xy2d");

    for n in [64u32, 256, 1024, 4096].iter() {
        group.bench_with_input(BenchmarkId::new("n", n), n, |b, &n| {
            b.iter(|| {
                for i in 0..1000i32 {
                    let x = (i as u32) % n;
                    let y = ((i / n as i32) as u32) % n;
                    black_box(hilbert_xy2d(n, x, y));
                }
            });
        });
    }

    group.finish();
}

// ============================================
// Batch Operation Benchmarks
// ============================================

fn bench_d2xy_batch(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_batch_d2xy");

    for size in [1000usize, 10000, 100000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &size| {
            let indices: Vec<u32> = (0..size as u32).collect();
            b.iter(|| {
                black_box(hilbert_batch_d2xy(1024, &indices));
            });
        });
    }

    group.finish();
}

fn bench_xy2d_batch(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_batch_xy2d");

    for size in [1000usize, 10000, 100000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &size| {
            let coords: Vec<(u32, u32)> = (0..size as u32)
                .map(|i| (i % 1024, (i / 1024) % 1024))
                .collect();
            b.iter(|| {
                black_box(hilbert_batch_xy2d(1024, &coords));
            });
        });
    }

    group.finish();
}

// ============================================
// Texture Mapping Simulation
// ============================================

fn bench_texture_mapping(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_texture_mapping");

    // Simulate mapping a brain state to RTS texture coordinates
    group.bench_function("brain_to_texture_1k", |b| {
        b.iter(|| {
            // Simulate 1D brain state array mapped to 2D texture
            for i in 0..1024 {
                let (x, y) = hilbert_d2xy(32, i);
                black_box((x, y));
            }
        });
    });

    group.bench_function("brain_to_texture_64k", |b| {
        b.iter(|| {
            // Simulate larger brain state (256x256 texture)
            for i in 0..65536 {
                let (x, y) = hilbert_d2xy(256, i);
                black_box((x, y));
            }
        });
    });

    group.bench_function("brain_to_texture_1m", |b| {
        b.iter(|| {
            // Simulate full 1024x1024 texture
            for i in 0..1048576 {
                let (x, y) = hilbert_d2xy(1024, i);
                black_box((x, y));
            }
        });
    });

    group.finish();
}

// ============================================
// Comparison with Row-Major Order
// ============================================

fn bench_hilbert_vs_row_major(c: &mut Criterion) {
    let mut group = c.benchmark_group("hilbert_vs_row_major");

    let size = 1024u32;

    // Row-major (simple index to coordinates)
    group.bench_function("row_major_1m", |b| {
        b.iter(|| {
            for i in 0..1048576u32 {
                let x = i % size;
                let y = i / size;
                black_box((x, y));
            }
        });
    });

    // Hilbert (spatial locality preserving)
    group.bench_function("hilbert_1m", |b| {
        b.iter(|| {
            for i in 0..1048576u32 {
                let (x, y) = hilbert_d2xy(size, i);
                black_box((x, y));
            }
        });
    });

    group.finish();
}

// ============================================
// Memory Access Pattern Simulation
// ============================================

fn bench_memory_access_patterns(c: &mut Criterion) {
    let mut group = c.benchmark_group("memory_access_patterns");

    // Simulate texture memory
    let texture_size = 1024;
    let texture: Vec<u8> = vec![0u8; texture_size * texture_size * 4]; // RGBA

    // Sequential access (row-major)
    group.bench_function("sequential_row_major", |b| {
        b.iter(|| {
            let mut sum = 0u64;
            for y in 0..texture_size {
                for x in 0..texture_size {
                    let offset = (y * texture_size + x) * 4;
                    sum += texture[offset] as u64;
                }
            }
            black_box(sum);
        });
    });

    // Hilbert curve access
    group.bench_function("hilbert_access", |b| {
        b.iter(|| {
            let mut sum = 0u64;
            for d in 0..(texture_size * texture_size) {
                let (x, y) = hilbert_d2xy(texture_size as u32, d as u32);
                let offset = ((y as usize * texture_size) + x as usize) * 4;
                sum += texture[offset] as u64;
            }
            black_box(sum);
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_d2xy_single,
    bench_xy2d_single,
    bench_d2xy_batch,
    bench_xy2d_batch,
    bench_texture_mapping,
    bench_hilbert_vs_row_major,
    bench_memory_access_patterns,
);
criterion_main!(benches);
