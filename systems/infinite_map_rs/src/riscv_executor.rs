use bytemuck::{Pod, Zeroable};
use log::info;
use std::io::{Cursor, Read};
use std::sync::Arc;

// Phase 48: WGSL i64 Compatibility
use crate::gpu_capabilities::{GpuCapabilities, I64Strategy};
use crate::i64_emulation::generate_i64_emulation_wgsl;

/// RISC-V Executor - Integrates the Pixel CPU VM into the compositor
///
/// This module provides the bridge between:
/// - The Infinite Map compositor (Smithay + WGPU)
/// - The Pixel CPU shader (WGSL-based RISC-V emulator)
/// - .rts.png encoded programs
/// - Linux boot bundles (.lnx.png)

/// Linux boot bundle header (must match pixel_bundler.py)
///
/// Memory Layout:
/// - [0:4]   = magic "LNX\0"
/// - [4:8]   = entry point (u32)
/// - [8:12]  = kernel size (u32)
/// - [12:16] = initrd size (u32)
/// - [16:20] = dtb size (u32)
#[repr(C, packed)]
#[derive(Debug, Clone, Copy)]
pub struct LinuxBundleHeader {
    pub magic: [u8; 4],
    pub entry_point: u32,
    pub kernel_size: u32,
    pub initrd_size: u32,
    pub dtb_size: u32,
}

impl LinuxBundleHeader {
    pub const MAGIC: [u8; 4] = [b'L', b'N', b'X', 0];

    pub fn from_bytes(data: &[u8]) -> Option<Self> {
        if data.len() < 20 {
            return None;
        }

        let magic = [data[0], data[1], data[2], data[3]];
        if magic != Self::MAGIC {
            return None;
        }

        let entry_point = u32::from_le_bytes([data[4], data[5], data[6], data[7]]);
        let kernel_size = u32::from_le_bytes([data[8], data[9], data[10], data[11]]);
        let initrd_size = u32::from_le_bytes([data[12], data[13], data[14], data[15]]);
        let dtb_size = u32::from_le_bytes([data[16], data[17], data[18], data[19]]);

        Some(Self {
            magic,
            entry_point,
            kernel_size,
            initrd_size,
            dtb_size,
        })
    }
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct RiscvUniforms {
    /// Current cycle count
    pub cycle_count: u32,
    /// Texture size (width/height)
    pub texture_size: u32,
    /// Program counter
    pub pc: u32,
    /// Base address for registers
    pub reg_base: u32,
    /// Base address for memory
    pub mem_base: u32,
    /// Number of instructions to execute this frame
    pub instruction_count: u32,
    /// Status flags
    pub status: u32, // bit 0 = running, bit 1 = halted, bit 2 = error
    /// Padding for alignment (total size must be 40 bytes to match WGSL vec2<u32> alignment)
    pub _padding: [u32; 3],
    pub vm_id: u32, // Phase 43: VM ID (0-7 for concurrent VMs)
}

impl RiscvUniforms {
    pub fn new(texture_size: u32) -> Self {
        Self {
            cycle_count: 0,
            texture_size,
            pc: 0x1000,             // Default entry point
            reg_base: 0,            // Registers at start of RAM
            mem_base: 256 * 4,      // Memory starts after register space
            instruction_count: 100, // Execute 100 instructions per frame
            status: 1,              // Running
            _padding: [0; 3],
            vm_id: 0, // Default to VM 0
        }
    }
}

/// Statistics returned from GPU after execution
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct RiscvStats {
    /// Total cycles executed
    pub cycles_executed: u32,
    /// Instructions executed
    pub instructions_executed: u32,
    /// Current PC
    pub current_pc: u32,
    /// Status code
    pub status: u32,
    /// Syscall number (if in syscall)
    pub syscall_num: u32,
    /// Syscall arg 0
    pub syscall_arg0: u32,
    /// Syscall arg 1
    pub syscall_arg1: u32,
    /// Syscall arg 2
    pub syscall_arg2: u32,
    /// Console buffer position
    pub console_pos: u32,
    /// Padding
    pub _padding: [u32; 7],
}

/// Syscall queue entry (40 bytes, matching WGSL)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct SyscallEntry {
    pub vm_id: u32,
    pub num: u32,
    pub arg0: u32,
    pub arg1: u32,
    pub arg2: u32,
    pub arg3: u32,
    pub arg4: u32,
    pub arg5: u32,
    pub result: i32,
    pub _pad: u32,
}

/// Profiler entry (16 bytes, matching WGSL ProfilerEntry)
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct ProfilerEntry {
    pub pc: u32,
    pub count: u32,
    _pad: [u32; 3],
}

impl ProfilerEntry {
    /// Check if this block is hot enough for JIT compilation
    pub fn is_hot(&self) -> bool {
        self.count >= 10_000
    }
}

/// Phase 44: Profiler statistics summary
#[derive(Debug, Clone)]
pub struct ProfilerStats {
    pub total_blocks: usize,
    pub total_executions: u64,
    pub hot_blocks: usize,
    pub hottest_block: Option<ProfilerEntry>,
}

impl ProfilerStats {
    /// Compute statistics from a vector of profiler entries
    pub fn from_entries(entries: &[ProfilerEntry]) -> Self {
        let total_blocks = entries.len();
        let total_executions: u64 = entries.iter().map(|e| e.count as u64).sum();
        let hot_blocks = entries.iter().filter(|e| e.is_hot()).count();
        let hottest_block = entries.iter().max_by_key(|e| e.count).copied();

        ProfilerStats {
            total_blocks,
            total_executions,
            hot_blocks,
            hottest_block,
        }
    }

    /// Format statistics for display
    pub fn format(&self) -> String {
        let mut output = format!("🔍 Profiler Statistics:\n");
        output.push_str(&format!("  Total blocks tracked: {}\n", self.total_blocks));
        output.push_str(&format!("  Total executions: {}\n", self.total_executions));
        output.push_str(&format!("  Hot blocks (≥10k): {}\n", self.hot_blocks));

        if let Some(hottest) = self.hottest_block {
            output.push_str(&format!(
                "  Hottest block: 0x{:04x} ({} executions)\n",
                hottest.pc, hottest.count
            ));
        }

        output
    }
}

/// RISC-V Executor
pub struct RiscvExecutor {
    device: Arc<wgpu::Device>,
    pub queue: Arc<wgpu::Queue>,

    /// Phase 48: i64 strategy (Native or Emulate)
    i64_strategy: I64Strategy,

    /// RAM buffer (stores code, data, registers)
    pub ram_buffer: wgpu::Buffer,

    /// Display texture (for VM console output)
    pub display_texture: Arc<wgpu::Texture>,
    display_view: wgpu::TextureView,

    /// Compute pipeline for executing RISC-V instructions
    compute_pipeline: wgpu::ComputePipeline,

    /// Bind group layout
    bind_group_layout: wgpu::BindGroupLayout,

    /// Current bind group
    bind_group: wgpu::BindGroup,

    /// Uniform buffer
    uniform_buffer: wgpu::Buffer,

    /// Statistics buffer (GPU → CPU)
    stats_buffer: wgpu::Buffer,
    stats_staging_buffer: wgpu::Buffer,

    /// Console buffer (GPU → CPU for sys_write output)
    console_buffer: wgpu::Buffer,
    console_staging_buffer: wgpu::Buffer,

    /// Phase 43: Syscall Bridge Buffers
    pub syscall_queue_buffer: wgpu::Buffer,
    pub syscall_queue_staging: wgpu::Buffer,
    pub pending_counts_buffer: wgpu::Buffer,
    pub pending_counts_staging: wgpu::Buffer,
    pub vm_status_buffer: wgpu::Buffer,
    pub vm_status_staging: wgpu::Buffer,

    /// Phase 44: Profiler buffers (GPU → CPU for JIT profiling)
    pub profiler_buffer: wgpu::Buffer,
    pub profiler_staging: wgpu::Buffer,

    /// Current execution state
    uniforms: RiscvUniforms,

    /// Console output buffer
    console_output: String,

    /// Program loaded flag
    program_loaded: bool,

    /// Texture size
    texture_size: u32,

    /// Neuromodulation state
    neuromodulation: crate::cortex::Neuromodulator,
}

impl RiscvExecutor {
    /// Create a new RISC-V executor with the specified GPU capabilities
    /// This ensures the appropriate shader is selected based on i64 support
    pub fn new_with_caps(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        caps: &GpuCapabilities,
    ) -> Self {
        let texture_size = 8192u32;
        let i64_strategy = caps.get_i64_strategy();

        // Phase 48: Select shader based on i64 support
        let shader_source = match i64_strategy {
            I64Strategy::Native => {
                info!("Using native i64 support for RISC-V executor");
                include_str!("shaders/riscv_executor.wgsl").to_string()
            }
            I64Strategy::Emulate => {
                info!("Using i64 emulation for RISC-V executor");
                let mut shader = generate_i64_emulation_wgsl();
                shader.push_str("\n// Original shader with i64 replaced\n");
                let original = include_str!("shaders/riscv_executor.wgsl");
                shader.push_str(&Self::transform_i64_to_emulated(original));
                shader
            }
        };

        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("RISC-V Executor Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create RAM buffer (for storing raw bytes)
        // 8192^2 pixels * 4 bytes/pixel = 268,435,456 bytes (256MB)
        // This is sufficient for full Alpine kernel + initrd + growth
        let ram_size = (texture_size * texture_size * 4) as u64;
        let ram_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V RAM"),
            size: ram_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create display texture (for VM console output)
        let display_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("RISC-V Display"),
            size: wgpu::Extent3d {
                width: texture_size,
                height: texture_size,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::STORAGE_BINDING
                | wgpu::TextureUsages::TEXTURE_BINDING
                | wgpu::TextureUsages::COPY_DST
                | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        });
        let display_view = display_texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Load shader module
        let shader_source = include_str!("shaders/riscv_executor.wgsl");
        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("RISC-V Executor Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("RISC-V Executor Layout"),
            entries: &[
                // Uniforms
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // RAM buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Stats buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Syscall queue buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Display (write)
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::WriteOnly,
                        format: wgpu::TextureFormat::Rgba8Unorm,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                // Console buffer (for sys_write output)
                wgpu::BindGroupLayoutEntry {
                    binding: 5,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Pending counts buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 6,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // VM status buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 7,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Phase 44: Profiler buffer
                wgpu::BindGroupLayoutEntry {
                    binding: 8,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("RISC-V Executor Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create compute pipeline
        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("RISC-V Executor Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader_module,
            entry_point: "main_riscv",
        });

        // Create uniform buffer
        let uniforms = RiscvUniforms::new(texture_size);
        let uniform_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Uniforms"),
            size: std::mem::size_of::<RiscvUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create stats buffers
        let stats_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Stats GPU"),
            size: std::mem::size_of::<RiscvStats>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let stats_staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Stats Staging"),
            size: std::mem::size_of::<RiscvStats>() as u64,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create console buffers (256 u32 = 1024 bytes)
        const CONSOLE_BUFFER_SIZE: u64 = 256 * 4;
        let console_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Console GPU"),
            size: CONSOLE_BUFFER_SIZE,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let console_staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Console Staging"),
            size: CONSOLE_BUFFER_SIZE,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Phase 43 Buffers
        let syscall_queue_size = (std::mem::size_of::<SyscallEntry>() * 128) as u64;
        let syscall_queue_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Syscall Queue"),
            size: syscall_queue_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        let syscall_queue_staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Syscall Queue Staging"),
            size: syscall_queue_size,
            usage: wgpu::BufferUsages::MAP_READ
                | wgpu::BufferUsages::MAP_WRITE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let pending_counts_size = (std::mem::size_of::<u32>() * 8) as u64;
        let pending_counts_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Pending Counts"),
            size: pending_counts_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        let pending_counts_staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Pending Counts Staging"),
            size: pending_counts_size,
            usage: wgpu::BufferUsages::MAP_READ
                | wgpu::BufferUsages::MAP_WRITE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let vm_status_size = (std::mem::size_of::<u32>() * 8) as u64;
        let vm_status_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM Status"),
            size: vm_status_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        let vm_status_staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V VM Status Staging"),
            size: vm_status_size,
            usage: wgpu::BufferUsages::MAP_READ
                | wgpu::BufferUsages::MAP_WRITE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Phase 44: Profiler buffers
        const MAX_PROFILED_BLOCKS: usize = 256;
        let profiler_size = (std::mem::size_of::<ProfilerEntry>() * MAX_PROFILED_BLOCKS) as u64;
        let profiler_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Profiler"),
            size: profiler_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let profiler_staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("RISC-V Profiler Staging"),
            size: profiler_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("RISC-V Executor Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: ram_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: stats_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: syscall_queue_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: wgpu::BindingResource::TextureView(&display_view),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: console_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 6,
                    resource: pending_counts_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 7,
                    resource: vm_status_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 8,
                    resource: profiler_buffer.as_entire_binding(),
                },
            ],
        });

        Self {
            device,
            queue,
            display_texture: Arc::new(display_texture),
            display_view,
            compute_pipeline,
            bind_group_layout,
            bind_group,
            ram_buffer,
            uniform_buffer,
            stats_buffer,
            stats_staging_buffer,
            console_buffer,
            console_staging_buffer,
            syscall_queue_buffer,
            syscall_queue_staging,
            pending_counts_buffer,
            pending_counts_staging,
            vm_status_buffer,
            vm_status_staging,
            profiler_buffer,
            profiler_staging,
            uniforms,
            console_output: String::new(),
            program_loaded: false,
            texture_size,
            neuromodulation: crate::cortex::Neuromodulator::default(),
            i64_strategy,
        }
    }

    /// Legacy constructor - uses default capabilities (assumes i64 support)
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        // Create a default GpuCapabilities object
        // In practice, this should be called with new_with_caps
        let caps = GpuCapabilities {
            supports_i64: true, // Assume native support for legacy code
            vendor_name: "Unknown".to_string(),
            device_name: "Unknown".to_string(),
        };
        Self::new_with_caps(device, queue, &caps)
    }

    /// Get the current i64 strategy
    pub fn i64_strategy(&self) -> I64Strategy {
        self.i64_strategy
    }

    /// Phase 48: Transform i64 types in WGSL shader to emulated versions
    /// This replaces i64 types and operations with vec2<u32> equivalents
    fn transform_i64_to_emulated(shader: &str) -> String {
        let mut result = shader.to_string();

        // Replace array<i64, N> with array<vec2<u32>, N>
        // Note: The current shader doesn't use i64, but this is future-proofing
        result = regex::Regex::new(r"array<i64,(\s*\d+)>")
            .unwrap()
            .replace_all(&result, "array<vec2<u32>,$1>")
            .to_string();

        // Replace var<storage,> declarations with i64
        result = regex::Regex::new(r":\s*array<i64>")
            .unwrap()
            .replace_all(&result, ": array<vec2<u32>>")
            .to_string();

        // Replace function parameters and return types
        result = regex::Regex::new(r"fn\s+(\w+)\(([^)]*)\)\s*->\s*i64")
            .unwrap()
            .replace_all(&result, "fn $1($2) -> vec2<u32>")
            .to_string();

        // Replace i64 literals (e.g., 1i64)
        result = regex::Regex::new(r"(\d+)i64")
            .unwrap()
            .replace_all(&result, "vec2<u32>($1u, 0u)")
            .to_string();

        result
    }

    pub fn set_neuromodulation(&mut self, neuro: crate::cortex::Neuromodulator) {
        self.neuromodulation = neuro;
    }

    /// Get current metabolic state for telemetry/visualization
    pub fn get_metabolic_state(&self) -> (crate::cortex::Neuromodulator, u32) {
        let current_budget = self.uniforms.instruction_count;
        (self.neuromodulation, current_budget)
    }

    /// Load a program from a .rts.png file
    /// Detects Linux boot bundles (LNX magic) and loads them appropriately
    pub fn load_program_from_file(&mut self, path: &str) -> Result<(), String> {
        let path = std::path::Path::new(path);
        if !path.exists() {
            return Err(format!("File not found: {}", path.display()));
        }

        let img = image::open(path).map_err(|e| format!("Failed to open image: {}", e))?;

        let rgba = img.to_rgba8();

        // Convert RGBA pixels to flat byte array
        let data: Vec<u8> = rgba
            .pixels()
            .flat_map(|p| vec![p[0], p[1], p[2], p[3]])
            .collect();

        // Check for Linux bundle magic first
        if data.len() >= 4 && &data[0..4] == LinuxBundleHeader::MAGIC {
            info!("Detected Linux boot bundle in file: {}", path.display());
            return self.load_linux_bundle(&data);
        }

        self.load_program(&data, 0)
    }

    /// Load a program from a raw binary file at a specific offset
    pub fn load_program_raw(&mut self, path: &str, offset: u64) -> Result<(), String> {
        let path = std::path::Path::new(path);
        if !path.exists() {
            return Err(format!("File not found: {}", path.display()));
        }

        let data = std::fs::read(path).map_err(|e| format!("Failed to read file: {}", e))?;

        self.load_program(&data, offset)
    }

    /// Load a Linux boot bundle with kernel, initrd, and device tree
    ///
    /// Recognizes the LNX magic header and sets up Linux boot registers:
    /// - a0 (x10) = hart ID (0 for boot hart)
    /// - a1 (x11) = DTB address
    /// - a2 (x12) = 0 (reserved)
    /// - a3 (x13) = 0 (reserved)
    ///
    /// Memory offsets must match Python bundler:
    /// - KERNEL_OFFSET = 0x1000
    /// - INITRD_OFFSET = 0x01000000 (16MB)
    /// - DTB_OFFSET = 0x02000000 (32MB)
    pub fn load_linux_bundle(&mut self, data: &[u8]) -> Result<(), String> {
        info!("Loading Linux boot bundle ({} bytes)", data.len());

        // Check for LNX magic header
        if let Some(header) = LinuxBundleHeader::from_bytes(data) {
            // Copy values to avoid packed field references
            let entry_point = header.entry_point;
            let kernel_size = header.kernel_size;
            let initrd_size = header.initrd_size;
            let dtb_size = header.dtb_size;

            info!("Recognized Linux boot bundle: magic='LNX', entry_point={:#x}, kernel={} bytes, initrd={} bytes, dtb={} bytes",
                entry_point, kernel_size, initrd_size, dtb_size);
            return self.load_linux_bundle_parsed(
                data,
                entry_point,
                kernel_size,
                initrd_size,
                dtb_size,
            );
        }

        // Fall back to regular program load
        info!("No LNX magic found, loading as regular program");
        self.load_program(data, 0)
    }

    fn load_linux_bundle_parsed(
        &mut self,
        data: &[u8],
        entry_point: u32,
        kernel_size: u32,
        initrd_size: u32,
        _dtb_size: u32,
    ) -> Result<(), String> {
        // Memory layout constants (must match pixel_bundler.py)
        const KERNEL_OFFSET: u64 = 0x1000;
        const INITRD_OFFSET: u64 = 0x01000000; // 16MB
        const DTB_OFFSET: u64 = 0x02000000; // 32MB
        const HEADER_SIZE: u64 = 20; // 5 x u32

        // Load the full payload into RAM at offset 0
        // The payload starts after the 20-byte header
        let payload = &data[HEADER_SIZE as usize..];
        let mut aligned_payload = payload.to_vec();

        // Align to 4 bytes for GPU writes
        while aligned_payload.len() % 4 != 0 {
            aligned_payload.push(0);
        }

        info!(
            "Writing payload ({} bytes) to GPU RAM at offset 0",
            aligned_payload.len()
        );
        self.queue
            .write_buffer(&self.ram_buffer, 0, &aligned_payload);

        // Set up Linux boot registers
        // a0 (x10) = hart ID (0 for boot hart)
        // a1 (x11) = DTB address (0x02000000)
        // a2 (x12) = 0 (reserved)
        // a3 (x13) = 0 (reserved)

        let a0_value: u32 = 0; // hart ID
        let a1_value: u32 = DTB_OFFSET as u32; // DTB address
        let a2_value: u32 = 0; // reserved
        let a3_value: u32 = 0; // reserved

        // Write register values to RAM
        // Registers are stored at the start of RAM: x0=offset 0, x1=offset 4, ..., x10=offset 40
        let a0_addr = 10 * 4; // Register x10 (a0)
        let a1_addr = 11 * 4; // Register x11 (a1)
        let a2_addr = 12 * 4; // Register x12 (a2)
        let a3_addr = 13 * 4; // Register x13 (a3)

        self.queue
            .write_buffer(&self.ram_buffer, a0_addr as u64, &a0_value.to_le_bytes());
        self.queue
            .write_buffer(&self.ram_buffer, a1_addr as u64, &a1_value.to_le_bytes());
        self.queue
            .write_buffer(&self.ram_buffer, a2_addr as u64, &a2_value.to_le_bytes());
        self.queue
            .write_buffer(&self.ram_buffer, a3_addr as u64, &a3_value.to_le_bytes());

        info!(
            "Linux boot registers set: a0={}, a1={:#x}, a2={}, a3={}",
            a0_value, a1_value, a2_value, a3_value
        );

        // Set entry point
        self.uniforms.pc = entry_point;
        self.program_loaded = true;
        self.uniforms.status = 1; // Running

        info!(
            "Linux boot bundle loaded successfully, PC set to {:#x}",
            entry_point
        );
        Ok(())
    }

    /// Load a program from binary data (raw or RTS-PNG pixels) at an offset
    pub fn load_program(&mut self, data: &[u8], offset: u64) -> Result<(), String> {
        info!(
            "Loading RISC-V program ({} bytes) at offset 0x{:x}",
            data.len(),
            offset
        );

        let mut aligned_data = data.to_vec();
        while aligned_data.len() % 4 != 0 {
            aligned_data.push(0);
        }

        // Load data into RAM buffer at specified offset
        self.queue
            .write_buffer(&self.ram_buffer, offset, &aligned_data);

        // Extract entry point from the loaded data
        // Pixel 1 (bytes 4-7) contains the 32-bit entry point
        if data.len() >= 8 {
            let entry_point = u32::from_le_bytes([data[4], data[5], data[6], data[7]]);

            // If entry point is 0, default to 0x400 (after 256 pixel header)
            let final_entry = if entry_point == 0 { 0x400 } else { entry_point };

            self.uniforms.pc = final_entry;
            info!("Entry point recognized: 0x{:08x}", final_entry);
        }

        self.program_loaded = true;
        self.uniforms.status = 1; // Running

        info!("Program loaded successfully and uploaded to GPU");
        Ok(())
    }

    /// Phase 43: Set VM ID for multi-VM execution (0-7)
    pub fn set_vm_id(&mut self, vm_id: u32) {
        self.uniforms.vm_id = vm_id;
        info!("VM ID set to {}", vm_id);
    }

    /// Load binary data directly to RAM at specified offset (no entry point extraction)
    pub fn load_binary(&mut self, data: &[u8], offset: u64) -> Result<(), String> {
        info!(
            "Loading binary ({} bytes) at offset 0x{:x}",
            data.len(),
            offset
        );

        // Align data to 4 bytes
        let mut aligned_data = data.to_vec();
        while aligned_data.len() % 4 != 0 {
            aligned_data.push(0);
        }

        // Write to RAM buffer
        self.queue
            .write_buffer(&self.ram_buffer, offset, &aligned_data);

        info!("Binary loaded successfully");
        Ok(())
    }

    /// Set Program Counter directly
    pub fn set_pc(&mut self, pc: u32) {
        self.uniforms.pc = pc;
        self.program_loaded = true;
        self.uniforms.status = 1; // Running
        info!("PC set to 0x{:08x}", pc);
    }

    pub fn get_display_texture(&self) -> Arc<wgpu::Texture> {
        self.display_texture.clone()
    }

    pub fn get_display_view(&self) -> &wgpu::TextureView {
        &self.display_view
    }

    /// Execute one frame of the VM
    pub fn execute_frame(&mut self) {
        if !self.program_loaded || self.uniforms.status & 1 == 0 {
            return; // Not running
        }

        // Neuromodulated instruction budget
        let base_budget = 10000u32;
        // Dopamine boosts speed (focus/reward) - up to 3x
        let dopamine_multiplier = 1.0 + (self.neuromodulation.dopamine * 2.0);
        // High Urgency (>0.7) throttles compute to save bandwidth/attention for survival,
        // or could boost it depending on strategy. Let's say it forces a flush or throttle.
        // The user suggested throttling compute for IO flush.
        let urgency_throttle = if self.neuromodulation.urgency > 0.7 {
            0.5
        } else {
            1.0
        };

        self.uniforms.instruction_count =
            (base_budget as f32 * dopamine_multiplier * urgency_throttle) as u32;

        // Update uniforms
        self.uniforms.cycle_count += 1;
        self.queue.write_buffer(
            &self.uniform_buffer,
            0,
            bytemuck::cast_slice(&[self.uniforms]),
        );

        // Create command encoder
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("RISC-V Execute Frame"),
            });

        // Dispatch compute shader
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("RISC-V Compute Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.compute_pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        // Copy stats to staging buffer
        encoder.copy_buffer_to_buffer(
            &self.stats_buffer,
            0,
            &self.stats_staging_buffer,
            0,
            std::mem::size_of::<RiscvStats>() as u64,
        );

        // Copy console buffer to staging buffer
        const CONSOLE_BUFFER_SIZE: u64 = 256 * 4;
        encoder.copy_buffer_to_buffer(
            &self.console_buffer,
            0,
            &self.console_staging_buffer,
            0,
            CONSOLE_BUFFER_SIZE,
        );

        // Phase 43: Copy syscall bridge buffers to staging
        encoder.copy_buffer_to_buffer(
            &self.pending_counts_buffer,
            0,
            &self.pending_counts_staging,
            0,
            (std::mem::size_of::<u32>() * 8) as u64,
        );
        encoder.copy_buffer_to_buffer(
            &self.vm_status_buffer,
            0,
            &self.vm_status_staging,
            0,
            (std::mem::size_of::<u32>() * 8) as u64,
        );
        encoder.copy_buffer_to_buffer(
            &self.syscall_queue_buffer,
            0,
            &self.syscall_queue_staging,
            0,
            (std::mem::size_of::<SyscallEntry>() * 128) as u64,
        );

        // Submit
        self.queue.submit(std::iter::once(encoder.finish()));

        // Sync Read-back of stats to update PC for next frame
        {
            let buffer_slice = self.stats_staging_buffer.slice(..);
            let (tx, rx) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| {
                tx.send(v).expect("Failed to send map result")
            });

            self.device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = rx.recv() {
                let data = buffer_slice.get_mapped_range();
                let stats: &RiscvStats = bytemuck::from_bytes(&data);

                // Update PC and status from GPU results
                self.uniforms.pc = stats.current_pc;

                // Check for syscalls and log them
                if stats.syscall_num != 0 {
                    info!(
                        "Syscall: {} (args: 0x{:x}, 0x{:x}, 0x{:x})",
                        stats.syscall_num,
                        stats.syscall_arg0,
                        stats.syscall_arg1,
                        stats.syscall_arg2
                    );
                }

                // Only stop if HALTED (bit 1) or ERROR (bit 2)
                if stats.status & 6 != 0 {
                    self.uniforms.status = stats.status;
                    info!(
                        "RISC-V VM Halted at PC: 0x{:08x} (Status: {})",
                        stats.current_pc, stats.status
                    );
                }

                drop(data);
                self.stats_staging_buffer.unmap();
            }
        }

        // Sync Read-back of console buffer for sys_write output
        {
            let buffer_slice = self.console_staging_buffer.slice(..);
            let (tx, rx) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| {
                tx.send(v).expect("Failed to send map result")
            });

            self.device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = rx.recv() {
                let data = buffer_slice.get_mapped_range();
                let console_u32: &[u32] = bytemuck::cast_slice(&data);

                // Decode console output (each u32 contains 4 bytes)
                let mut output = String::new();
                for &word in console_u32 {
                    if word == 0 {
                        break;
                    }
                    // Extract bytes from little-endian u32
                    let b0 = (word & 0xFF) as u8;
                    let b1 = ((word >> 8) & 0xFF) as u8;
                    let b2 = ((word >> 16) & 0xFF) as u8;
                    let b3 = ((word >> 24) & 0xFF) as u8;

                    for byte in [b0, b1, b2, b3] {
                        if byte != 0 && byte.is_ascii() {
                            output.push(byte as char);
                        }
                    }
                }

                if !output.is_empty() {
                    info!("Console output: {}", output);
                    self.console_output.push_str(&output);
                }

                drop(data);
                self.console_staging_buffer.unmap();
            }
        }

        // Phase 43: Sync read-back of pending counts and status
        {
            let status_slice = self.vm_status_staging.slice(..);
            let pending_slice = self.pending_counts_staging.slice(..);
            let queue_slice = self.syscall_queue_staging.slice(..);

            let (tx, rx) = std::sync::mpsc::channel();
            status_slice.map_async(wgpu::MapMode::Read, move |v| {
                tx.send(v).expect("Failed to send status map result")
            });
            self.device.poll(wgpu::Maintain::Wait);
            let _ = rx.recv();

            let (tx, rx) = std::sync::mpsc::channel();
            pending_slice.map_async(wgpu::MapMode::Read, move |v| {
                tx.send(v).expect("Failed to send pending map result")
            });
            self.device.poll(wgpu::Maintain::Wait);
            let _ = rx.recv();

            let status_data = status_slice.get_mapped_range();
            let status: &[u32] = bytemuck::cast_slice(&status_data);

            let pending_data = pending_slice.get_mapped_range();
            let pending: &[u32] = bytemuck::cast_slice(&pending_data);

            if status[0] == 1 {
                // STATUS_WAITING_SYSCALL
                let count = pending[0];
                info!("VM 0 triggered {} syscall(s)", count);

                let (tx, rx) = std::sync::mpsc::channel();
                queue_slice.map_async(wgpu::MapMode::Read, move |v| {
                    tx.send(v).expect("Failed to send queue map result")
                });
                self.device.poll(wgpu::Maintain::Wait);
                let _ = rx.recv();

                let queue_data = queue_slice.get_mapped_range();
                let queue: &[SyscallEntry] = bytemuck::cast_slice(&queue_data);

                // Process first syscall in the burst (simplified for Phase 43)
                if count > 0 {
                    let entry = &queue[0]; // Assuming vm_id 0, slot 0 for simple test
                    info!("Processing Syscall {} for VM {}", entry.num, entry.vm_id);

                    match entry.num {
                        64 => {
                            // sys_write
                            // For now, we still use the display texture for visual feedback,
                            // but we could handle terminal output here.
                            info!(
                                "sys_write(fd={}, ptr=0x{:x}, len={})",
                                entry.arg0, entry.arg1, entry.arg2
                            );
                        }
                        93 => {
                            // sys_exit
                            info!("VM {} exited with code {}", entry.vm_id, entry.arg0);
                            // We'll set status to halted in a separate step
                        }
                        _ => {
                            info!("Unhandled syscall: {}", entry.num);
                        }
                    }
                }

                drop(queue_data);
                self.syscall_queue_staging.unmap();

                // Resume VM: Clear pending and status
                drop(status_data);
                self.vm_status_staging.unmap();
                drop(pending_data);
                self.pending_counts_staging.unmap();

                let zeros = [0u32; 8];
                self.queue.write_buffer(
                    &self.pending_counts_buffer,
                    0,
                    bytemuck::cast_slice(&zeros),
                );
                self.queue
                    .write_buffer(&self.vm_status_buffer, 0, bytemuck::cast_slice(&zeros));
            } else {
                drop(status_data);
                self.vm_status_staging.unmap();
                drop(pending_data);
                self.pending_counts_staging.unmap();
            }
        }
    }

    /// Check if VM is still running
    pub fn is_running(&self) -> bool {
        self.program_loaded && (self.uniforms.status & 1) != 0
    }

    /// Check if VM has halted
    pub fn is_halted(&self) -> bool {
        self.program_loaded && (self.uniforms.status & 2) != 0
    }

    /// Get console output
    pub fn get_console_output(&self) -> &str {
        &self.console_output
    }

    /// Phase 44: Read profiler data from GPU
    /// Returns a vector of ProfilerEntry with execution counts
    pub fn read_profiler_data(&self) -> Vec<ProfilerEntry> {
        const MAX_PROFILED_BLOCKS: usize = 256;
        let profiler_size = (std::mem::size_of::<ProfilerEntry>() * MAX_PROFILED_BLOCKS) as u64;

        // Create encoder for copy operation
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Profiler Readback Encoder"),
            });

        // Copy profiler_buffer → profiler_staging
        encoder.copy_buffer_to_buffer(
            &self.profiler_buffer,
            0,
            &self.profiler_staging,
            0,
            profiler_size,
        );

        // Submit the copy
        self.queue.submit(Some(encoder.finish()));

        // Map the staging buffer for reading (callback-based)
        // Note: In a real app, you'd need to poll the device for the buffer to be mapped
        // For now, we'll do a synchronous read which is less efficient but simpler
        let buffer_slice = self.profiler_staging.slice(..);
        buffer_slice.map_async(wgpu::MapMode::Read, |_| {});

        // Poll device until buffer is mapped
        self.device.poll(wgpu::MaintainBase::Wait);

        // Get the mapped data
        let profiler_slice = buffer_slice.get_mapped_range();

        // Copy data into a Vec
        let mut data = vec![0u8; profiler_size as usize];
        data.copy_from_slice(&profiler_slice);

        // Drop the mapped slice to unmap the buffer
        drop(profiler_slice);
        self.profiler_staging.unmap();

        // Parse profiler data
        let mut entries = Vec::new();
        for i in 0..MAX_PROFILED_BLOCKS {
            let offset = i * std::mem::size_of::<ProfilerEntry>();
            let entry: ProfilerEntry =
                unsafe { std::ptr::read(data.as_ptr().add(offset) as *const ProfilerEntry) };
            // Only include entries with non-zero counts
            if entry.count > 0 {
                entries.push(entry);
            }
        }

        entries
    }

    /// Phase 44: Get profiler statistics
    pub fn get_profiler_stats(&self) -> ProfilerStats {
        let entries = self.read_profiler_data();
        ProfilerStats::from_entries(&entries)
    }

    /// Reset the VM
    pub fn reset(&mut self) {
        self.uniforms = RiscvUniforms::new(self.texture_size);
        self.console_output.clear();

        // Clear RAM
        let zeros = vec![0u8; (self.texture_size * self.texture_size * 4) as usize];
        self.queue.write_buffer(&self.ram_buffer, 0, &zeros);

        // Clear console buffer
        let console_zeros = vec![0u8; 256 * 4];
        self.queue
            .write_buffer(&self.console_buffer, 0, &console_zeros);

        self.program_loaded = false;
    }

    /// Send keyboard input to the VM
    pub fn send_input(&mut self, _key: char) {
        // TODO: Implement keyboard input buffer
        // This would write to a special MMIO region
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_riscv_uniforms_size() {
        assert_eq!(std::mem::size_of::<RiscvUniforms>(), 32);
    }

    #[test]
    fn test_riscv_stats_size() {
        assert_eq!(std::mem::size_of::<RiscvStats>(), 64);
    }

    #[test]
    fn test_riscv_syscall_entry_size() {
        assert_eq!(std::mem::size_of::<SyscallEntry>(), 40);
    }

    #[test]
    fn test_linux_bundle_header_magic() {
        assert_eq!(LinuxBundleHeader::MAGIC, [b'L', b'N', b'X', 0]);
    }

    #[test]
    fn test_linux_bundle_header_size() {
        assert_eq!(std::mem::size_of::<LinuxBundleHeader>(), 20);
    }

    #[test]
    fn test_linux_bundle_header_parsing() {
        let mut data = vec![0u8; 20];
        data[0..4].copy_from_slice(&[b'L', b'N', b'X', 0]);
        data[4..8].copy_from_slice(&0x1000u32.to_le_bytes());
        data[8..12].copy_from_slice(&1024u32.to_le_bytes());
        data[12..16].copy_from_slice(&2048u32.to_le_bytes());
        data[16..20].copy_from_slice(&512u32.to_le_bytes());

        let header = LinuxBundleHeader::from_bytes(&data).unwrap();
        // Copy values to avoid packed field references in assertions
        let magic = header.magic;
        let entry_point = header.entry_point;
        let kernel_size = header.kernel_size;
        let initrd_size = header.initrd_size;
        let dtb_size = header.dtb_size;

        assert_eq!(magic, [b'L', b'N', b'X', 0]);
        assert_eq!(entry_point, 0x1000);
        assert_eq!(kernel_size, 1024);
        assert_eq!(initrd_size, 2048);
        assert_eq!(dtb_size, 512);
    }

    #[test]
    fn test_linux_bundle_header_rejects_invalid_magic() {
        let mut data = vec![0u8; 20];
        data[0..4].copy_from_slice(&[b'X', b'Y', b'Z', b'Y']);

        assert!(LinuxBundleHeader::from_bytes(&data).is_none());
    }

    #[test]
    fn test_linux_bundle_header_rejects_short_data() {
        let data = vec![0u8; 10];
        assert!(LinuxBundleHeader::from_bytes(&data).is_none());
    }
}
