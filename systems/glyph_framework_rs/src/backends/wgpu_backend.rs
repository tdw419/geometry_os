use crate::backends::{ExecutionBackend, InputBusState, InputEvent};
use crate::types::{AppId, AppLayout, GlyphId, Intent};
use bytemuck::{Pod, Zeroable};
use std::collections::HashMap;

/// App execution context matching WGSL layout
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct AppContext {
    app_id: u32,
    origin_x: u32,
    origin_y: u32,
    width: u32,
    height: u32,
    pc: u32,
    halted: u32,
    flags: u32,
    _pad: [u32; 2],
}

/// Register file matching WGSL layout (32 registers)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct RegisterFile {
    regs: [u32; 32],
}

/// Memory matching WGSL layout (64KB = 16384 u32s)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct AppMemory {
    data: [[u32; 32]; 512], // 32 * 512 = 16384
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct StackFrame {
    return_pc: u32,
    _pad: [u32; 3],
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct CallStack {
    frames: [StackFrame; 64],
    depth: u32,
    _pad: [u32; 3],
}

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct SyscallRequest {
    app_id: u32,
    syscall_id: u32,
    arg1: u32,
    arg2: u32,
    return_value: u32,
    processed: u32,
    _pad: [u32; 2],
}

/// Visual Interaction Bus Header (32 bytes)
/// Matches WGSL layout for binding 9
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct InputBusHeader {
    magic: u32,     // 0x56494255 "VIBU"
    mouse_x: f32,   // 0-1920
    mouse_y: f32,   // 0-1080
    mouse_btn: u32, // Bitmask: 0=Left, 1=Right, 2=Middle
    kb_head: u32,   // Producer index (CPU writes)
    kb_tail: u32,   // Consumer index (GPU writes)
    kb_cap: u32,    // FIFO capacity (256)
    _pad: u32,
}

/// Key event entry in the VIB FIFO (16 bytes)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
struct KeyEventEntry {
    code: u32,      // ASCII or ScanCode
    state: u32,     // 1=Down, 0=Up
    mods: u32,      // Shift=1, Ctrl=2, Alt=4, Super=8
    timestamp: u32, // Relative ms
}

const VIB_MAGIC: u32 = 0x56494255; // "VIBU"
const VIB_FIFO_CAPACITY: usize = 256;
const VIB_BUFFER_SIZE: u64 = 32 + (16 * VIB_FIFO_CAPACITY as u64); // Header + FIFO

pub struct WgpuBackend {
    instance: wgpu::Instance,
    adapter: Option<wgpu::Adapter>,
    device: Option<wgpu::Device>,
    queue: Option<wgpu::Queue>,
    shader_module: Option<wgpu::ShaderModule>,

    // GPU Resources
    context_buffer: Option<wgpu::Buffer>,
    register_buffer: Option<wgpu::Buffer>,
    memory_buffer: Option<wgpu::Buffer>,
    stack_buffer: Option<wgpu::Buffer>,
    syscall_buffer: Option<wgpu::Buffer>,
    syscall_count_buffer: Option<wgpu::Buffer>,
    frame_count_buffer: Option<wgpu::Buffer>,
    display_buffer: Option<wgpu::Buffer>,
    atlas_buffer: Option<wgpu::Buffer>,
    input_bus_buffer: Option<wgpu::Buffer>,

    // CPU-side VIB state (shadow copy)
    vib_kb_head: u32,

    compute_pipeline: Option<wgpu::ComputePipeline>,
    bind_group: Option<wgpu::BindGroup>,

    // CPU State
    apps: HashMap<AppId, usize>, // AppId -> Index in buffers
    next_index: usize,
    max_apps: usize,
}

impl WgpuBackend {
    pub fn new(max_apps: usize) -> Self {
        let instance = wgpu::Instance::default();
        Self {
            instance,
            adapter: None,
            device: None,
            queue: None,
            shader_module: None,
            context_buffer: None,
            register_buffer: None,
            memory_buffer: None,
            stack_buffer: None,
            syscall_buffer: None,
            syscall_count_buffer: None,
            frame_count_buffer: None,
            display_buffer: None,
            atlas_buffer: None,
            input_bus_buffer: None,
            vib_kb_head: 0,
            compute_pipeline: None,
            bind_group: None,
            apps: HashMap::new(),
            next_index: 0,
            max_apps,
        }
    }
}

impl ExecutionBackend for WgpuBackend {
    fn init(&mut self) -> Result<(), String> {
        let adapter =
            pollster::block_on(self.instance.request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                compatible_surface: None,
                force_fallback_adapter: false,
            }))
            .ok_or("Failed to find a suitable GPU adapter")?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("GlyphVM Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits {
                    max_storage_buffers_per_shader_stage: 10, // Default 8, need 9 for VIB
                    ..wgpu::Limits::default()
                },
            },
            None,
        ))
        .map_err(|e| format!("Failed to create device: {}", e))?;

        // Load shader
        let shader_paths = [
            "systems/infinite_map_rs/src/shaders/glyph_vm.wgsl",
            "../infinite_map_rs/src/shaders/glyph_vm.wgsl",
            "../../systems/infinite_map_rs/src/shaders/glyph_vm.wgsl",
            "systems/spatial_coordinator/wgsl/glyph_vm.wgsl",
            "../spatial_coordinator/wgsl/glyph_vm.wgsl",
            "../../systems/spatial_coordinator/wgsl/glyph_vm.wgsl",
        ];

        let mut shader_source = None;
        for path in shader_paths {
            if let Ok(source) = std::fs::read_to_string(path) {
                shader_source = Some(source);
                break;
            }
        }

        let shader_source = shader_source.ok_or_else(|| {
            "Failed to find glyph_vm.wgsl shader file in any standard location".to_string()
        })?;

        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("GlyphVM Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create buffers
        let context_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("App Contexts"),
            size: (std::mem::size_of::<AppContext>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let register_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Register Files"),
            size: (std::mem::size_of::<RegisterFile>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let memory_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("App Memory"),
            size: (std::mem::size_of::<AppMemory>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let stack_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Call Stacks"),
            size: (std::mem::size_of::<CallStack>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let syscall_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Syscall Queue"),
            size: (std::mem::size_of::<SyscallRequest>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let syscall_count_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Syscall Count"),
            size: 8,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let frame_count_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Frame Count"),
            size: 4,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let display_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Display Buffer"),
            size: 1920 * 1080 * 4,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let atlas_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Font Atlas"),
            size: 8192,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Visual Interaction Bus (Binding 9)
        let input_bus_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Input Bus"),
            size: VIB_BUFFER_SIZE,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Initialize VIB header with magic and defaults
        let vib_header = InputBusHeader {
            magic: VIB_MAGIC,
            mouse_x: 0.0,
            mouse_y: 0.0,
            mouse_btn: 0,
            kb_head: 0,
            kb_tail: 0,
            kb_cap: VIB_FIFO_CAPACITY as u32,
            _pad: 0,
        };
        queue.write_buffer(&input_bus_buffer, 0, bytemuck::bytes_of(&vib_header));

        // Zero all buffers initially
        let zero_contexts = vec![0u8; ((std::mem::size_of::<AppContext>() * self.max_apps))];
        queue.write_buffer(&context_buffer, 0, &zero_contexts);

        let zero_memory = vec![0u8; ((std::mem::size_of::<AppMemory>() * self.max_apps))];
        queue.write_buffer(&memory_buffer, 0, &zero_memory);

        let zero_registers =
            vec![0u8; ((std::mem::size_of::<RegisterFile>() * self.max_apps))];
        queue.write_buffer(&register_buffer, 0, &zero_registers);

        // Bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("GlyphVM Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
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
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
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
                wgpu::BindGroupLayoutEntry {
                    binding: 6,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
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
                wgpu::BindGroupLayoutEntry {
                    binding: 8,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 9: Visual Interaction Bus (read_write)
                wgpu::BindGroupLayoutEntry {
                    binding: 9,
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

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("GlyphVM Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: context_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: register_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: memory_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: stack_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: syscall_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: syscall_count_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 6,
                    resource: frame_count_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 7,
                    resource: display_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 8,
                    resource: atlas_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 9,
                    resource: input_bus_buffer.as_entire_binding(),
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("GlyphVM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("GlyphVM Compute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader_module,
            entry_point: "main",
        });

        self.adapter = Some(adapter);
        self.device = Some(device);
        self.queue = Some(queue);
        self.shader_module = Some(shader_module);
        self.context_buffer = Some(context_buffer);
        self.register_buffer = Some(register_buffer);
        self.memory_buffer = Some(memory_buffer);
        self.stack_buffer = Some(stack_buffer);
        self.syscall_buffer = Some(syscall_buffer);
        self.syscall_count_buffer = Some(syscall_count_buffer);
        self.frame_count_buffer = Some(frame_count_buffer);
        self.display_buffer = Some(display_buffer);
        self.atlas_buffer = Some(atlas_buffer);
        self.input_bus_buffer = Some(input_bus_buffer);
        self.compute_pipeline = Some(compute_pipeline);
        self.bind_group = Some(bind_group);

        Ok(())
    }

    fn spawn_app(&mut self, _name: &str, layout: AppLayout) -> Result<AppId, String> {
        if self.next_index >= self.max_apps {
            return Err("Maximum number of applications reached".to_string());
        }

        let app_id = AppId(self.next_index as u64);
        let index = self.next_index;
        self.next_index += 1;
        self.apps.insert(app_id, index);

        let context = AppContext {
            app_id: app_id.0 as u32,
            origin_x: layout.x,
            origin_y: layout.y,
            width: layout.width,
            height: layout.height,
            pc: 0,
            halted: 0,
            flags: 0,
            _pad: [0; 2],
        };

        if let (
            Some(device),
            Some(queue),
            Some(context_buffer),
            Some(register_buffer),
            Some(stack_buffer),
            Some(syscall_buffer),
        ) = (
            &self.device,
            &self.queue,
            &self.context_buffer,
            &self.register_buffer,
            &self.stack_buffer,
            &self.syscall_buffer,
        ) {
            // Initialize Context
            let bytes = bytemuck::bytes_of(&context);
            queue.write_buffer(
                context_buffer,
                (index * std::mem::size_of::<AppContext>()) as u64,
                bytes,
            );

            // Initialize Registers (all zeros)
            let regs = RegisterFile { regs: [0; 32] };
            queue.write_buffer(
                register_buffer,
                (index * std::mem::size_of::<RegisterFile>()) as u64,
                bytemuck::bytes_of(&regs),
            );

            // Initialize Stack
            let stack = CallStack {
                frames: [StackFrame {
                    return_pc: 0,
                    _pad: [0; 3],
                }; 64],
                depth: 0,
                _pad: [0; 3],
            };
            queue.write_buffer(
                stack_buffer,
                (index * std::mem::size_of::<CallStack>()) as u64,
                bytemuck::bytes_of(&stack),
            );

            // Initialize Syscall Request
            let syscall = SyscallRequest {
                app_id: app_id.0 as u32,
                syscall_id: 0,
                arg1: 0,
                arg2: 0,
                return_value: 0,
                processed: 1, // Start as processed
                _pad: [0; 2],
            };
            queue.write_buffer(
                syscall_buffer,
                (index * std::mem::size_of::<SyscallRequest>()) as u64,
                bytemuck::bytes_of(&syscall),
            );

            queue.submit(std::iter::once(
                device
                    .create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None })
                    .finish(),
            ));
        }

        Ok(app_id)
    }

    fn set_state(&mut self, app_id: AppId, addr: u64, value: f32) -> Result<(), String> {
        let index = self.apps.get(&app_id).ok_or("Application not found")?;

        if let (Some(queue), Some(memory_buffer)) = (&self.queue, &self.memory_buffer) {
            let val_u32 = value.to_bits();
            queue.write_buffer(
                memory_buffer,
                (index * std::mem::size_of::<AppMemory>() + (addr as usize * 4)) as u64,
                bytemuck::bytes_of(&val_u32),
            );
            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn get_state(&mut self, app_id: AppId, addr: u64) -> Result<f32, String> {
        let results = self.get_state_range(app_id, addr, 1)?;
        Ok(results[0])
    }

    fn get_state_range(
        &mut self,
        app_id: AppId,
        addr: u64,
        count: u64,
    ) -> Result<Vec<f32>, String> {
        let index = *self.apps.get(&app_id).ok_or("Application not found")?;

        if let (Some(device), Some(queue), Some(memory_buffer)) =
            (&self.device, &self.queue, &self.memory_buffer)
        {
            let size = count * 4;
            let offset = (index * std::mem::size_of::<AppMemory>() + (addr as usize * 4)) as u64;

            let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Memory Read Staging"),
                size,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Memory Read Encoder"),
            });

            encoder.copy_buffer_to_buffer(memory_buffer, offset, &staging_buffer, 0, size);
            queue.submit(std::iter::once(encoder.finish()));

            let buffer_slice = staging_buffer.slice(..);
            let (sender, receiver) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());

            device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = receiver.recv() {
                let data = buffer_slice.get_mapped_range();
                let mut results = Vec::with_capacity(count as usize);
                for i in 0..count as usize {
                    let start = i * 4;
                    let result_u32 = u32::from_ne_bytes(
                        data[start..start + 4]
                            .try_into()
                            .expect("Slice to array conversion failed"),
                    );
                    results.push(f32::from_bits(result_u32));
                }
                drop(data);
                staging_buffer.unmap();
                Ok(results)
            } else {
                Err("Failed to map buffer for reading".to_string())
            }
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn get_context(&mut self, app_id: AppId) -> Result<[u32; 10], String> {
        let index = *self.apps.get(&app_id).ok_or("Application not found")?;

        if let (Some(device), Some(queue), Some(context_buffer)) =
            (&self.device, &self.queue, &self.context_buffer)
        {
            let size = 256u64; // Read more
            let offset = 0u64; // Start from 0

            let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Context Read Staging"),
                size,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Context Read Encoder"),
            });

            encoder.copy_buffer_to_buffer(context_buffer, offset, &staging_buffer, 0, size);
            queue.submit(std::iter::once(encoder.finish()));

            let buffer_slice = staging_buffer.slice(..);
            let (sender, receiver) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());

            device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = receiver.recv() {
                let data = buffer_slice.get_mapped_range();
                let mut result = [0u32; 10];

                let start = index * std::mem::size_of::<AppContext>();
                for i in 0..10 {
                    let idx = start + i * 4;
                    result[i] = u32::from_ne_bytes(data[idx..idx + 4].try_into().unwrap());
                }
                drop(data);
                staging_buffer.unmap();
                Ok(result)
            } else {
                Err("Failed to map buffer for reading".to_string())
            }
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn get_display_pixel(&mut self, x: u32, y: u32) -> Result<u32, String> {
        if let (Some(device), Some(queue), Some(display_buffer)) =
            (&self.device, &self.queue, &self.display_buffer)
        {
            let offset = (y * 1920 + x) as u64 * 4;
            let size = 4u64;

            let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Pixel Read Staging"),
                size,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Pixel Read Encoder"),
            });

            encoder.copy_buffer_to_buffer(display_buffer, offset, &staging_buffer, 0, size);
            queue.submit(std::iter::once(encoder.finish()));

            let buffer_slice = staging_buffer.slice(..);
            let (sender, receiver) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());

            device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = receiver.recv() {
                let data = buffer_slice.get_mapped_range();
                let result = u32::from_ne_bytes(data[..].try_into().unwrap());
                drop(data);
                staging_buffer.unmap();
                Ok(result)
            } else {
                Err("Failed to map buffer for reading".to_string())
            }
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn send_intent(&mut self, app_id: AppId, intent: Intent) -> Result<(), String> {
        let index = self.apps.get(&app_id).ok_or("Application not found")?;

        if let (Some(queue), Some(register_buffer), Some(memory_buffer)) =
            (&self.queue, &self.register_buffer, &self.memory_buffer)
        {
            match intent {
                Intent::MouseClick { x, y } => {
                    let payload = (x << 16) | (y & 0xFFFF);
                    let int_type = 1u32;

                    queue.write_buffer(
                        register_buffer,
                        (index * std::mem::size_of::<RegisterFile>() + (29 * 4)) as u64,
                        bytemuck::bytes_of(&payload),
                    );
                    queue.write_buffer(
                        register_buffer,
                        (index * std::mem::size_of::<RegisterFile>() + (30 * 4)) as u64,
                        bytemuck::bytes_of(&int_type),
                    );
                },
                Intent::KeyPress(c) => {
                    let char_val = c as u32;
                    let pending = 1u32;
                    let mem_base = index * std::mem::size_of::<AppMemory>();

                    // Map to memory addresses 102 (INPUT_PENDING) and 103 (INPUT_CHAR)
                    queue.write_buffer(
                        memory_buffer,
                        (mem_base + (102 * 4)) as u64,
                        bytemuck::bytes_of(&pending),
                    );
                    queue.write_buffer(
                        memory_buffer,
                        (mem_base + (103 * 4)) as u64,
                        bytemuck::bytes_of(&char_val),
                    );

                    let halted_offset = (index * std::mem::size_of::<AppContext>() + 24) as u64;
                    let active = 0u32;
                    if let Some(context_buffer) = &self.context_buffer {
                        queue.write_buffer(
                            context_buffer,
                            halted_offset,
                            bytemuck::bytes_of(&active),
                        );
                    }
                },
                _ => {},
            }
            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn load_spirv(&mut self, _app_id: AppId, _spirv: &[u32]) -> Result<(), String> {
        Ok(())
    }

    fn load_font_atlas(&mut self, atlas_data: &[u8]) -> Result<(), String> {
        if let (Some(queue), Some(atlas_buffer)) = (&self.queue, &self.atlas_buffer) {
            queue.write_buffer(atlas_buffer, 0, atlas_data);
            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn draw(
        &mut self,
        _app_id: AppId,
        _glyph_id: GlyphId,
        _local_x: u32,
        _local_y: u32,
    ) -> Result<(), String> {
        Ok(())
    }

    fn step(&mut self) -> Result<(), String> {
        if let (Some(device), Some(queue), Some(pipeline), Some(bind_group), Some(frame_buffer)) = (
            &self.device,
            &self.queue,
            &self.compute_pipeline,
            &self.bind_group,
            &self.frame_count_buffer,
        ) {
            use std::sync::atomic::{AtomicU32, Ordering};
            static FRAME: AtomicU32 = AtomicU32::new(0);
            let frame = FRAME.fetch_add(1, Ordering::Relaxed) + 1;
            queue.write_buffer(frame_buffer, 0, bytemuck::bytes_of(&frame));

            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("GlyphVM Encoder"),
            });

            {
                let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some("GlyphVM Compute Pass"),
                    timestamp_writes: None,
                });
                compute_pass.set_pipeline(pipeline);
                compute_pass.set_bind_group(0, bind_group, &[]);
                let workgroups = (self.max_apps as u32).div_ceil(64);
                compute_pass.dispatch_workgroups(workgroups, 1, 1);
            }

            queue.submit(std::iter::once(encoder.finish()));
            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn write_input_event(&mut self, event: InputEvent) -> Result<(), String> {
        if let (Some(queue), Some(input_bus_buffer)) = (&self.queue, &self.input_bus_buffer) {
            let head = self.vib_kb_head;
            let fifo_offset = 32 + (head as u64 % VIB_FIFO_CAPACITY as u64) * 16;

            // Write key event entry
            let entry = KeyEventEntry {
                code: event.code,
                state: event.state,
                mods: event.mods,
                timestamp: event.timestamp,
            };
            queue.write_buffer(input_bus_buffer, fifo_offset, bytemuck::bytes_of(&entry));

            // Update kb_head in header and shadow state
            self.vib_kb_head = head + 1;
            queue.write_buffer(input_bus_buffer, 16, bytemuck::bytes_of(&self.vib_kb_head));

            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn get_input_bus_state(&mut self) -> Result<InputBusState, String> {
        if let (Some(device), Some(queue), Some(input_bus_buffer)) =
            (&self.device, &self.queue, &self.input_bus_buffer)
        {
            let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Input Bus Read Staging"),
                size: 32, // Just the header
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Input Bus Read Encoder"),
            });

            encoder.copy_buffer_to_buffer(input_bus_buffer, 0, &staging_buffer, 0, 32);
            queue.submit(std::iter::once(encoder.finish()));

            let buffer_slice = staging_buffer.slice(..);
            let (sender, receiver) = std::sync::mpsc::channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());

            device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = receiver.recv() {
                let data = buffer_slice.get_mapped_range();
                let header: InputBusHeader = *bytemuck::from_bytes(&data);
                drop(data);
                staging_buffer.unmap();

                Ok(InputBusState {
                    magic: header.magic,
                    mouse_x: header.mouse_x,
                    mouse_y: header.mouse_y,
                    mouse_btn: header.mouse_btn,
                    kb_head: header.kb_head,
                    kb_tail: header.kb_tail,
                    kb_cap: header.kb_cap,
                })
            } else {
                Err("Failed to map input bus buffer".to_string())
            }
        } else {
            Err("Backend not initialized".to_string())
        }
    }
}
