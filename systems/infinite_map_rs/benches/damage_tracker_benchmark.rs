// Damage Tracker Performance Benchmark
//
// Validates damage tracking performance against targets:
// - Cell dirty marking: < 10ns per cell
// - Rectangle merging: < 100ns per merge
// - Full scan for dirty rects: < 1ms for 80x24 terminal
// - Hilbert coordinate conversion: < 50ns per coordinate

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

/// Simplified DirtyRect for benchmarking (matches src/damage_tracker.rs)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct DirtyRect {
    pub x1: u32,
    pub y1: u32,
    pub x2: u32,
    pub y2: u32,
}

impl DirtyRect {
    pub fn new(x1: u32, y1: u32, x2: u32, y2: u32) -> Self {
        Self { x1, y1, x2, y2 }
    }

    pub fn from_cell(x: u32, y: u32) -> Self {
        Self {
            x1: x,
            y1: y,
            x2: x + 1,
            y2: y + 1,
        }
    }

    pub fn merge(&mut self, other: &DirtyRect) {
        self.x1 = self.x1.min(other.x1);
        self.y1 = self.y1.min(other.y1);
        self.x2 = self.x2.max(other.x2);
        self.y2 = self.y2.max(other.y2);
    }

    pub fn overlaps_or_adjacent(&self, other: &DirtyRect) -> bool {
        self.x1 <= other.x2 + 1
            && self.x2 + 1 >= other.x1
            && self.y1 <= other.y2 + 1
            && self.y2 + 1 >= other.y1
    }

    pub fn area(&self) -> u32 {
        (self.x2.saturating_sub(self.x1)) * (self.y2.saturating_sub(self.y1))
    }
}

/// Simplified DamageTracker for benchmarking
pub struct DamageTracker {
    cols: u32,
    rows: u32,
    dirty_cells: Vec<u64>,
    has_damage: bool,
}

impl DamageTracker {
    pub fn new(cols: u32, rows: u32) -> Self {
        let cells = (cols * rows) as usize;
        let words = (cells + 63) / 64;
        Self {
            cols,
            rows,
            dirty_cells: vec![0u64; words],
            has_damage: false,
        }
    }

    #[inline]
    pub fn mark_dirty(&mut self, x: u32, y: u32) {
        if x < self.cols && y < self.rows {
            let idx = (y * self.cols + x) as usize;
            let word = idx / 64;
            let bit = idx % 64;
            self.dirty_cells[word] |= 1u64 << bit;
            self.has_damage = true;
        }
    }

    pub fn clear(&mut self) {
        self.dirty_cells.fill(0);
        self.has_damage = false;
    }

    pub fn get_dirty_rects(&self) -> Vec<DirtyRect> {
        if !self.has_damage {
            return Vec::new();
        }

        // Simple scanline-based algorithm
        let mut rects: Vec<DirtyRect> = Vec::new();

        for y in 0..self.rows {
            for x in 0..self.cols {
                let idx = (y * self.cols + x) as usize;
                let word = idx / 64;
                let bit = idx % 64;

                if (self.dirty_cells[word] >> bit) & 1 == 1 {
                    let cell_rect = DirtyRect::from_cell(x, y);

                    // Try to merge with existing rectangles
                    let mut merged = false;
                    for rect in &mut rects {
                        if rect.overlaps_or_adjacent(&cell_rect) {
                            rect.merge(&cell_rect);
                            merged = true;
                            break;
                        }
                    }

                    if !merged {
                        rects.push(cell_rect);
                    }
                }
            }
        }

        // Merge pass
        let mut changed = true;
        while changed {
            changed = false;
            let mut i = 0;
            while i < rects.len() {
                let mut j = i + 1;
                while j < rects.len() {
                    if rects[i].overlaps_or_adjacent(&rects[j]) {
                        rects[i].merge(&rects[j]);
                        rects.remove(j);
                        changed = true;
                    } else {
                        j += 1;
                    }
                }
                i += 1;
            }
        }

        rects
    }
}

/// Hilbert curve coordinate conversion (simplified)
fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let mut x: u32 = 0;
    let mut y: u32 = 0;
    let mut s: u32 = 1;
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

fn rot(n: u32, x: &mut u32, y: &mut u32, rx: u32, ry: u32) {
    if ry == 0 {
        if rx == 1 {
            *x = n - 1 - *x;
            *y = n - 1 - *y;
        }
        std::mem::swap(x, y);
    }
}

// ============================================
// Benchmarks
// ============================================

/// Benchmark single cell dirty marking
fn bench_mark_dirty(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_mark_dirty");

    for size in [(80, 24), (160, 48), (320, 96)].iter() {
        let (cols, rows) = *size;
        group.bench_with_input(
            BenchmarkId::new("terminal", format!("{}x{}", cols, rows)),
            size,
            |b, &(cols, rows)| {
                let mut tracker = DamageTracker::new(cols, rows);
                let mut x = 0u32;
                let mut y = 0u32;
                b.iter(|| {
                    tracker.mark_dirty(x, y);
                    x = (x + 1) % cols;
                    if x == 0 {
                        y = (y + 1) % rows;
                    }
                    black_box(&tracker);
                });
            },
        );
    }

    group.finish();
}

/// Benchmark random cell dirty marking (simulates typical terminal updates)
fn bench_mark_dirty_random(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_mark_random");

    for &(cols, rows) in &[(80, 24), (160, 48)] {
        group.throughput(Throughput::Elements(1000));
        group.bench_with_input(
            BenchmarkId::new("random", format!("{}x{}", cols, rows)),
            &(cols, rows),
            |b, &(cols, rows)| {
                let mut tracker = DamageTracker::new(cols, rows);
                // Use deterministic pseudo-random sequence
                let mut rng_state = 12345u32;
                b.iter(|| {
                    for _ in 0..1000 {
                        rng_state = rng_state.wrapping_mul(1103515245).wrapping_add(12345);
                        let x = (rng_state >> 16) % cols;
                        rng_state = rng_state.wrapping_mul(1103515245).wrapping_add(12345);
                        let y = (rng_state >> 16) % rows;
                        tracker.mark_dirty(x, y);
                    }
                    black_box(&tracker);
                });
            },
        );
    }

    group.finish();
}

/// Benchmark dirty rectangle computation
fn bench_get_dirty_rects(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_get_rects");

    // Sparse updates (typical terminal usage)
    group.bench_function("sparse_80x24", |b| {
        let mut tracker = DamageTracker::new(80, 24);
        // Mark ~10% of cells as dirty
        for y in 0..24 {
            for x in 0..80 {
                if (x + y) % 10 == 0 {
                    tracker.mark_dirty(x, y);
                }
            }
        }
        b.iter(|| {
            let rects = tracker.get_dirty_rects();
            black_box(rects);
        });
    });

    // Dense updates (full screen redraw)
    group.bench_function("dense_80x24", |b| {
        let mut tracker = DamageTracker::new(80, 24);
        for y in 0..24 {
            for x in 0..80 {
                tracker.mark_dirty(x, y);
            }
        }
        b.iter(|| {
            let rects = tracker.get_dirty_rects();
            black_box(rects);
        });
    });

    // Large terminal
    group.bench_function("large_160x48", |b| {
        let mut tracker = DamageTracker::new(160, 48);
        for y in 0..48 {
            for x in 0..160 {
                if (x + y) % 8 == 0 {
                    tracker.mark_dirty(x, y);
                }
            }
        }
        b.iter(|| {
            let rects = tracker.get_dirty_rects();
            black_box(rects);
        });
    });

    group.finish();
}

/// Benchmark rectangle merging operations
fn bench_rect_merge(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_rect_merge");

    group.bench_function("adjacent_merge", |b| {
        let mut rect1 = DirtyRect::new(0, 0, 10, 10);
        let rect2 = DirtyRect::new(10, 0, 20, 10);
        b.iter(|| {
            rect1.merge(&rect2);
            black_box(&rect1);
            // Reset
            rect1 = DirtyRect::new(0, 0, 10, 10);
        });
    });

    group.bench_function("overlapping_merge", |b| {
        let mut rect1 = DirtyRect::new(0, 0, 15, 15);
        let rect2 = DirtyRect::new(10, 10, 20, 20);
        b.iter(|| {
            rect1.merge(&rect2);
            black_box(&rect1);
            rect1 = DirtyRect::new(0, 0, 15, 15);
        });
    });

    group.bench_function("batch_merge_100", |b| {
        b.iter(|| {
            let mut rects: Vec<DirtyRect> = (0..100)
                .map(|i| DirtyRect::new(i * 2, i * 2, i * 2 + 5, i * 2 + 5))
                .collect();

            // Merge all adjacent rects
            let mut changed = true;
            while changed {
                changed = false;
                let mut i = 0;
                while i < rects.len() {
                    let mut j = i + 1;
                    while j < rects.len() {
                        if rects[i].overlaps_or_adjacent(&rects[j]) {
                            rects[i].merge(&rects[j]);
                            rects.remove(j);
                            changed = true;
                        } else {
                            j += 1;
                        }
                    }
                    i += 1;
                }
            }
            black_box(rects);
        });
    });

    group.finish();
}

/// Benchmark Hilbert coordinate conversion
fn bench_hilbert_conversion(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_hilbert");

    let n = 256u32; // 256x256 grid

    group.throughput(Throughput::Elements(1000));
    group.bench_function("d2xy_1000", |b| {
        b.iter(|| {
            let mut coords = Vec::with_capacity(1000);
            for i in 0..1000u32 {
                let (x, y) = hilbert_d2xy(n, i);
                coords.push((x, y));
            }
            black_box(coords);
        });
    });

    // Sequential access (good cache locality)
    group.bench_function("sequential_10k", |b| {
        b.iter(|| {
            let mut sum = 0u64;
            for i in 0..10000u32 {
                let (x, y) = hilbert_d2xy(n, i);
                sum += x as u64 + y as u64;
            }
            black_box(sum);
        });
    });

    // Random access (cache stress)
    group.bench_function("random_10k", |b| {
        let indices: Vec<u32> = (0..10000).map(|i| (i * 7919) % (n * n)).collect();
        b.iter(|| {
            let mut sum = 0u64;
            for &idx in &indices {
                let (x, y) = hilbert_d2xy(n, idx);
                sum += x as u64 + y as u64;
            }
            black_box(sum);
        });
    });

    group.finish();
}

/// Benchmark full damage tracking workflow
fn bench_full_workflow(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_workflow");

    // Simulate a full frame of terminal updates
    group.bench_function("frame_80x24_typing", |b| {
        b.iter(|| {
            let mut tracker = DamageTracker::new(80, 24);

            // Simulate typing: mark cells along a line
            for x in 0..40 {
                tracker.mark_dirty(x, 12);
            }

            // Get dirty rects
            let rects = tracker.get_dirty_rects();

            // Clear for next frame
            tracker.clear();

            black_box(rects);
        });
    });

    // Simulate scrolling
    group.bench_function("frame_80x24_scroll", |b| {
        b.iter(|| {
            let mut tracker = DamageTracker::new(80, 24);

            // Simulate scroll: mark all cells
            for y in 0..24 {
                for x in 0..80 {
                    tracker.mark_dirty(x, y);
                }
            }

            let rects = tracker.get_dirty_rects();
            tracker.clear();

            black_box(rects);
        });
    });

    // Simulate mixed workload
    group.bench_function("frame_80x24_mixed", |b| {
        b.iter(|| {
            let mut tracker = DamageTracker::new(80, 24);

            // Cursor movement
            tracker.mark_dirty(10, 5);
            tracker.mark_dirty(10, 6);

            // Output at bottom
            for x in 0..30 {
                tracker.mark_dirty(x, 23);
            }

            // Status bar update
            for x in 0..80 {
                tracker.mark_dirty(x, 0);
            }

            let rects = tracker.get_dirty_rects();
            tracker.clear();

            black_box(rects);
        });
    });

    group.finish();
}

/// Benchmark memory usage patterns
fn bench_memory_patterns(c: &mut Criterion) {
    let mut group = c.benchmark_group("damage_memory");

    // Test cache efficiency with different sizes
    for &size in &[64, 128, 256, 512, 1024] {
        let cells = size * size;
        group.throughput(Throughput::Bytes(cells / 8)); // One bit per cell

        group.bench_with_input(
            BenchmarkId::new("scan", format!("{}x{}", size, size)),
            &size,
            |b, &size| {
                let mut tracker = DamageTracker::new(size, size);
                // Mark every 8th cell
                for y in 0..size {
                    for x in 0..size {
                        if (x + y) % 8 == 0 {
                            tracker.mark_dirty(x, y);
                        }
                    }
                }
                b.iter(|| {
                    let rects = tracker.get_dirty_rects();
                    black_box(rects);
                });
            },
        );
    }

    group.finish();
}

criterion_group!(
    benches,
    bench_mark_dirty,
    bench_mark_dirty_random,
    bench_get_dirty_rects,
    bench_rect_merge,
    bench_hilbert_conversion,
    bench_full_workflow,
    bench_memory_patterns,
);
criterion_main!(benches);
