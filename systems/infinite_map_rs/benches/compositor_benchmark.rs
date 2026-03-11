// Compositor Performance Benchmark
//
// Validates compositor performance against targets:
// - Frame time: < 16ms (60 FPS target)
// - Texture upload: < 2ms for 1024x1024
// - Damage region processing: < 1ms per frame
// - GPU command submission: < 0.5ms

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

// ============================================
// Mock Types for Benchmarking
// ============================================

/// Rectangle for damage tracking
#[derive(Debug, Clone, Copy, Default)]
pub struct Rect {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

impl Rect {
    pub fn new(x: u32, y: u32, width: u32, height: u32) -> Self {
        Self { x, y, width, height }
    }

    pub fn area(&self) -> u32 {
        self.width * self.height
    }

    pub fn intersects(&self, other: &Rect) -> bool {
        self.x < other.x + other.width
            && self.x + self.width > other.x
            && self.y < other.y + other.height
            && self.y + self.height > other.y
    }
}

/// Texture format descriptor
#[derive(Debug, Clone, Copy)]
pub struct TextureFormat {
    pub width: u32,
    pub height: u32,
    pub bytes_per_pixel: u32,
}

impl TextureFormat {
    pub fn new(width: u32, height: u32, bytes_per_pixel: u32) -> Self {
        Self { width, height, bytes_per_pixel }
    }

    pub fn size_bytes(&self) -> usize {
        (self.width * self.height * self.bytes_per_pixel) as usize
    }
}

/// Damage region for partial updates
#[derive(Debug, Clone, Default)]
pub struct DamageRegion {
    pub rects: Vec<Rect>,
    pub total_area: u32,
}

impl DamageRegion {
    pub fn new() -> Self {
        Self { rects: Vec::new(), total_area: 0 }
    }

    pub fn add_rect(&mut self, rect: Rect) {
        self.total_area += rect.area();
        self.rects.push(rect);
    }

    pub fn is_empty(&self) -> bool {
        self.rects.is_empty()
    }
}

/// Simulated GPU command buffer
pub struct CommandBuffer {
    commands: Vec<Command>,
    vertex_count: usize,
    index_count: usize,
}

#[derive(Debug, Clone)]
pub enum Command {
    SetTexture(u32, TextureFormat),
    DrawRect(Rect, u32), // rect, texture_id
    DrawText(Rect, String, u32),
    Clear([f32; 4]),
    SetBlendMode(bool),
}

impl CommandBuffer {
    pub fn new() -> Self {
        Self {
            commands: Vec::new(),
            vertex_count: 0,
            index_count: 0,
        }
    }

    pub fn clear(&mut self) {
        self.commands.clear();
        self.vertex_count = 0;
        self.index_count = 0;
    }

    pub fn push_command(&mut self, cmd: Command) {
        match &cmd {
            Command::DrawRect(_, _) => {
                self.vertex_count += 4;
                self.index_count += 6;
            }
            Command::DrawText(_, _, _) => {
                // Approximate character count
                self.vertex_count += 16;
                self.index_count += 24;
            }
            _ => {}
        }
        self.commands.push(cmd);
    }

    pub fn command_count(&self) -> usize {
        self.commands.len()
    }
}

/// Compositor state for benchmarking
pub struct CompositorState {
    screen_width: u32,
    screen_height: u32,
    damage: DamageRegion,
    textures: Vec<TextureFormat>,
    cmd_buffer: CommandBuffer,
    frame_count: u64,
}

impl CompositorState {
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            screen_width: width,
            screen_height: height,
            damage: DamageRegion::new(),
            textures: Vec::new(),
            cmd_buffer: CommandBuffer::new(),
            frame_count: 0,
        }
    }

    pub fn add_texture(&mut self, format: TextureFormat) -> u32 {
        let id = self.textures.len() as u32;
        self.textures.push(format);
        id
    }

    pub fn mark_dirty(&mut self, rect: Rect) {
        self.damage.add_rect(rect);
    }

    pub fn begin_frame(&mut self) {
        self.cmd_buffer.clear();
        self.frame_count += 1;
    }

    pub fn end_frame(&mut self) -> usize {
        let cmd_count = self.cmd_buffer.command_count();
        self.damage = DamageRegion::new();
        cmd_count
    }
}

// ============================================
// Benchmarks
// ============================================

/// Benchmark texture operations
fn bench_texture_operations(c: &mut Criterion) {
    let mut group = c.benchmark_group("comp_texture");

    // Texture size calculations
    for &(w, h) in &[(64, 64), (256, 256), (1024, 1024), (2048, 2048)] {
        group.bench_with_input(
            BenchmarkId::new("size_calc", format!("{}x{}", w, h)),
            &(w, h),
            |b, &(w, h)| {
                b.iter(|| {
                    let format = TextureFormat::new(w, h, 4);
                    let size = format.size_bytes();
                    black_box(size);
                });
            },
        );
    }

    // Texture upload simulation (memory copy)
    group.throughput(Throughput::Bytes(1024 * 1024 * 4));
    group.bench_function("upload_1k_rgba", |b| {
        let src = vec![0u8; 1024 * 1024 * 4];
        let mut dst = vec![0u8; 1024 * 1024 * 4];

        b.iter(|| {
            dst.copy_from_slice(&src);
            black_box(&dst);
        });
    });

    group.throughput(Throughput::Bytes(2048 * 2048 * 4));
    group.bench_function("upload_2k_rgba", |b| {
        let src = vec![0u8; 2048 * 2048 * 4];
        let mut dst = vec![0u8; 2048 * 2048 * 4];

        b.iter(|| {
            dst.copy_from_slice(&src);
            black_box(&dst);
        });
    });

    // Partial texture update (damage region)
    group.bench_function("partial_update_256x256", |b| {
        let full_texture = vec![0u8; 1024 * 1024 * 4];
        let region_data = vec![128u8; 256 * 256 * 4];
        let mut dest = full_texture.clone();

        b.iter(|| {
            // Copy 256x256 region at offset (512, 512)
            let offset_x = 512;
            let offset_y = 512;
            let region_width = 256;
            let region_height = 256;
            let stride = 1024 * 4;

            for y in 0..region_height {
                let dest_offset = ((offset_y + y) * stride + offset_x * 4) as usize;
                let src_offset = (y * region_width * 4) as usize;
                dest[dest_offset..dest_offset + region_width as usize * 4]
                    .copy_from_slice(&region_data[src_offset..src_offset + region_width as usize * 4]);
            }

            black_box(&dest);
            dest = full_texture.clone();
        });
    });

    group.finish();
}

/// Benchmark damage region processing
fn bench_damage_processing(c: &mut Criterion) {
    let mut group = c.benchmark_group("comp_damage");

    // Single rect addition
    group.bench_function("add_rect", |b| {
        let mut damage = DamageRegion::new();
        b.iter(|| {
            damage.add_rect(Rect::new(0, 0, 100, 100));
            damage = DamageRegion::new();
        });
    });

    // Multiple rect processing
    for &count in &[10, 50, 100, 500] {
        group.throughput(Throughput::Elements(count as u64));
        group.bench_with_input(
            BenchmarkId::new("add_rects", count),
            &count,
            |b, &count| {
                b.iter(|| {
                    let mut damage = DamageRegion::new();
                    for i in 0..count {
                        let x = (i % 10) * 100;
                        let y = (i / 10) * 100;
                        damage.add_rect(Rect::new(x as u32, y as u32, 50, 50));
                    }
                    black_box(damage);
                });
            },
        );
    }

    // Rect intersection testing
    group.bench_function("intersect_test_1k", |b| {
        let rects: Vec<Rect> = (0..1000)
            .map(|i| {
                let x = (i % 32) * 32;
                let y = (i / 32) * 32;
                Rect::new(x as u32, y as u32, 32, 32)
            })
            .collect();
        let test_rect = Rect::new(500, 500, 64, 64);

        b.iter(|| {
            let mut intersections = 0;
            for rect in &rects {
                if test_rect.intersects(rect) {
                    intersections += 1;
                }
            }
            black_box(intersections);
        });
    });

    group.finish();
}

/// Benchmark command buffer operations
fn bench_command_buffer(c: &mut Criterion) {
    let mut group = c.benchmark_group("comp_commands");

    // Single command push
    group.bench_function("push_single", |b| {
        let mut buffer = CommandBuffer::new();
        b.iter(|| {
            buffer.push_command(Command::SetBlendMode(true));
            buffer.clear();
        });
    });

    // Batch command push
    for &count in &[100, 500, 1000] {
        group.throughput(Throughput::Elements(count as u64));
        group.bench_with_input(
            BenchmarkId::new("push_batch", count),
            &count,
            |b, &count| {
                b.iter(|| {
                    let mut buffer = CommandBuffer::new();
                    for i in 0..count {
                        let rect = Rect::new((i % 10) as u32 * 100, (i / 10) as u32 * 100, 50, 50);
                        buffer.push_command(Command::DrawRect(rect, (i % 10) as u32));
                    }
                    black_box(buffer);
                });
            },
        );
    }

    // Mixed command workload
    group.bench_function("mixed_commands_500", |b| {
        b.iter(|| {
            let mut buffer = CommandBuffer::new();
            buffer.push_command(Command::Clear([0.0, 0.0, 0.0, 1.0]));
            buffer.push_command(Command::SetBlendMode(true));

            for i in 0..200 {
                let rect = Rect::new((i % 20) as u32 * 50, (i / 20) as u32 * 50, 40, 40);
                buffer.push_command(Command::DrawRect(rect, (i % 5) as u32));
            }

            for i in 0..50 {
                let rect = Rect::new((i % 10) as u32 * 100, (i / 10) as u32 * 100, 80, 20);
                buffer.push_command(Command::DrawText(rect, format!("Text {}", i), 0));
            }

            black_box(buffer);
        });
    });

    group.finish();
}

/// Benchmark full frame composition
fn bench_frame_composition(c: &mut Criterion) {
    let mut group = c.benchmark_group("comp_frame");

    // Simple frame (minimal damage)
    group.bench_function("simple_frame", |b| {
        let mut state = CompositorState::new(1920, 1080);

        b.iter(|| {
            state.begin_frame();
            state.mark_dirty(Rect::new(100, 100, 200, 50));

            state.cmd_buffer.push_command(Command::Clear([0.0, 0.0, 0.0, 1.0]));
            state.cmd_buffer.push_command(Command::DrawRect(Rect::new(100, 100, 200, 50), 0));

            let count = state.end_frame();
            black_box(count);
        });
    });

    // Terminal frame (typical workload)
    group.bench_function("terminal_frame_80x24", |b| {
        let mut state = CompositorState::new(1920, 1080);
        let char_width = 10;
        let char_height = 20;

        b.iter(|| {
            state.begin_frame();

            // Simulate terminal cell updates
            for row in 0..24 {
                for col in 0..80 {
                    // Only update ~10% of cells per frame
                    if (col + row) % 10 == 0 {
                        let x = col * char_width;
                        let y = row * char_height;
                        state.mark_dirty(Rect::new(x as u32, y as u32, char_width as u32, char_height as u32));
                    }
                }
            }

            state.cmd_buffer.push_command(Command::Clear([0.0, 0.0, 0.0, 1.0]));

            // Draw dirty cells
            for rect in &state.damage.rects {
                state.cmd_buffer.push_command(Command::DrawRect(*rect, 1));
            }

            let count = state.end_frame();
            black_box(count);
        });
    });

    // Complex frame (multiple windows)
    group.bench_function("complex_frame_multi_window", |b| {
        let mut state = CompositorState::new(1920, 1080);

        // Add textures for windows
        let tex1 = state.add_texture(TextureFormat::new(800, 600, 4));
        let tex2 = state.add_texture(TextureFormat::new(400, 400, 4));
        let tex3 = state.add_texture(TextureFormat::new(600, 300, 4));

        b.iter(|| {
            state.begin_frame();

            // Window 1 damage
            state.mark_dirty(Rect::new(50, 50, 800, 600));
            // Window 2 damage
            state.mark_dirty(Rect::new(900, 100, 400, 400));
            // Status bar damage
            state.mark_dirty(Rect::new(0, 1040, 1920, 40));

            state.cmd_buffer.push_command(Command::Clear([0.1, 0.1, 0.1, 1.0]));

            // Draw windows
            state.cmd_buffer.push_command(Command::DrawRect(Rect::new(50, 50, 800, 600), tex1));
            state.cmd_buffer.push_command(Command::DrawRect(Rect::new(900, 100, 400, 400), tex2));
            state.cmd_buffer.push_command(Command::DrawRect(Rect::new(50, 700, 600, 300), tex3));

            // Status bar
            state.cmd_buffer.push_command(Command::DrawRect(Rect::new(0, 1040, 1920, 40), 0));

            let count = state.end_frame();
            black_box(count);
        });
    });

    group.finish();
}

/// Benchmark memory operations for frame data
fn bench_frame_memory(c: &mut Criterion) {
    let mut group = c.benchmark_group("comp_memory");

    // Frame buffer allocation
    for &size in &[1920 * 1080usize, 2560 * 1440, 3840 * 2160] {
        group.throughput(Throughput::Bytes(size as u64 * 4));
        group.bench_with_input(
            BenchmarkId::new("allocate", format!("{}px", size)),
            &size,
            |b, &size| {
                b.iter(|| {
                    let buffer = vec![0u8; size * 4];
                    black_box(buffer);
                });
            },
        );
    }

    // Frame buffer clear
    let mut buffer_1080p = vec![0u8; 1920 * 1080 * 4];
    group.throughput(Throughput::Bytes(1920 * 1080 * 4));
    group.bench_function("clear_1080p", |b| {
        b.iter(|| {
            buffer_1080p.fill(0);
            black_box(&buffer_1080p);
        });
    });

    // Frame buffer copy
    let src_1080p = vec![128u8; 1920 * 1080 * 4];
    let mut dst_1080p = vec![0u8; 1920 * 1080 * 4];
    group.bench_function("copy_1080p", |b| {
        b.iter(|| {
            dst_1080p.copy_from_slice(&src_1080p);
            black_box(&dst_1080p);
        });
    });

    group.finish();
}

/// Benchmark rectangle packing (for texture atlases)
fn bench_rect_packing(c: &mut Criterion) {
    let mut group = c.benchmark_group("comp_packing");

    // Simple shelf packing algorithm
    fn shelf_pack(rects: &[(u32, u32)], atlas_width: u32, atlas_height: u32) -> Vec<Option<(u32, u32)>> {
        let mut positions = Vec::with_capacity(rects.len());
        let mut current_y = 0u32;
        let mut current_x = 0u32;
        let mut shelf_height = 0u32;

        for &(w, h) in rects {
            if current_x + w > atlas_width {
                // Move to next shelf
                current_x = 0;
                current_y += shelf_height;
                shelf_height = 0;
            }

            if current_y + h > atlas_height {
                positions.push(None);
            } else {
                positions.push(Some((current_x, current_y)));
                current_x += w;
                shelf_height = shelf_height.max(h);
            }
        }

        positions
    }

    // Generate test rectangles
    let small_rects: Vec<(u32, u32)> = (0..100)
        .map(|i| (8 + (i % 16) as u32, 8 + ((i + 7) % 16) as u32))
        .collect();

    let mixed_rects: Vec<(u32, u32)> = (0..100)
        .map(|i| {
            let size = if i % 3 == 0 { 64 } else if i % 3 == 1 { 32 } else { 16 };
            (size, size)
        })
        .collect();

    group.bench_function("pack_small_100", |b| {
        b.iter(|| {
            let positions = shelf_pack(&small_rects, 512, 512);
            black_box(positions);
        });
    });

    group.bench_function("pack_mixed_100", |b| {
        b.iter(|| {
            let positions = shelf_pack(&mixed_rects, 1024, 1024);
            black_box(positions);
        });
    });

    // Large scale packing
    let large_rects: Vec<(u32, u32)> = (0..1000)
        .map(|i| {
            let size = 8 + (i % 5) * 8;
            (size, size)
        })
        .collect();

    group.bench_function("pack_large_1k", |b| {
        b.iter(|| {
            let positions = shelf_pack(&large_rects, 2048, 2048);
            black_box(positions);
        });
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_texture_operations,
    bench_damage_processing,
    bench_command_buffer,
    bench_frame_composition,
    bench_frame_memory,
    bench_rect_packing,
);
criterion_main!(benches);
