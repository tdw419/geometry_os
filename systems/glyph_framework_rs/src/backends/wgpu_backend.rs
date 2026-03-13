use crate::backends::ExecutionBackend;
use crate::types::{AppId, AppLayout, GlyphId, Intent};
use bytemuck::{Pod, Zeroable};
use std::collections::HashMap;
use wgpu::util::DeviceExt;

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
    frame_count_buffer: Option<wgpu::Buffer>,
    
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
            frame_count_buffer: None,
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
        let adapter = pollster::block_on(self.instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        }))
        .ok_or("Failed to find a suitable GPU adapter")?;

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("GlyphVM Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .map_err(|e| format!("Failed to create device: {}", e))?;

        // Load shader
        let shader_source = std::fs::read_to_string("systems/spatial_coordinator/wgsl/glyph_vm.wgsl")
            .map_err(|e| format!("Failed to read shader file: {}", e))?;
        
        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("GlyphVM Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create buffers
        let context_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("App Contexts"),
            size: (std::mem::size_of::<AppContext>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let register_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Register Files"),
            size: (std::mem::size_of::<RegisterFile>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let memory_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("App Memory"),
            size: (std::mem::size_of::<AppMemory>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        let stack_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Call Stacks"),
            size: (std::mem::size_of::<CallStack>() * self.max_apps) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        let syscall_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Syscall Queue"),
            size: (std::mem::size_of::<SyscallRequest>() * self.max_apps + 8) as u64, // +8 for atomic count
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        
        let frame_count_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Frame Count"),
            size: 4,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

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
                    resource: wgpu::BindingResource::Buffer(wgpu::BufferBinding {
                        buffer: &syscall_buffer,
                        offset: 0,
                        size: Some(std::num::NonZeroU64::new((std::mem::size_of::<SyscallRequest>() * self.max_apps) as u64).unwrap()),
                    }),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: wgpu::BindingResource::Buffer(wgpu::BufferBinding {
                        buffer: &syscall_buffer,
                        offset: (std::mem::size_of::<SyscallRequest>() * self.max_apps) as u64,
                        size: Some(std::num::NonZeroU64::new(8).unwrap()),
                    }),
                },
                wgpu::BindGroupEntry {
                    binding: 6,
                    resource: frame_count_buffer.as_entire_binding(),
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
        self.frame_count_buffer = Some(frame_count_buffer);
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

        if let (Some(queue), 
                Some(context_buffer), 
                Some(register_buffer), 
                Some(stack_buffer),
                Some(syscall_buffer)) = (
            &self.queue, 
            &self.context_buffer, 
            &self.register_buffer, 
            &self.stack_buffer,
            &self.syscall_buffer
        ) {
            // Initialize Context
            queue.write_buffer(
                context_buffer,
                (index * std::mem::size_of::<AppContext>()) as u64,
                bytemuck::bytes_of(&context),
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
                frames: [StackFrame { return_pc: 0, _pad: [0; 3] }; 64],
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
        }

        Ok(app_id)
    }

    fn set_state(&mut self, app_id: AppId, addr: u64, value: f32) -> Result<(), String> {
        let index = self.apps.get(&app_id).ok_or("Application not found")?;
        
        if let (Some(queue), Some(memory_buffer)) = (&self.queue, &self.memory_buffer) {
            // Convert f32 to u32 for the memory buffer (Simplified)
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

    fn send_intent(&mut self, app_id: AppId, intent: Intent) -> Result<(), String> {
        let index = self.apps.get(&app_id).ok_or("Application not found")?;
        
        if let (Some(queue), Some(register_buffer)) = (&self.queue, &self.register_buffer) {
            match intent {
                Intent::MouseClick { x, y } => {
                    // Map to registers 29 and 30
                    let payload = (x << 16) | (y & 0xFFFF);
                    let int_type = 1u32; // Custom MouseClick type

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
                }
                _ => {} // Other intents not yet implemented
            }
            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }

    fn draw(&mut self, app_id: AppId, glyph_id: GlyphId, local_x: u32, local_y: u32) -> Result<(), String> {
        // Implement DRAW syscall simulation
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
            // Update frame count (Simplified)
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
                // Dispatch one workgroup per app (simplified)
                compute_pass.dispatch_workgroups(self.max_apps as u32, 1, 1);
            }

            queue.submit(std::iter::once(encoder.finish()));
            Ok(())
        } else {
            Err("Backend not initialized".to_string())
        }
    }
}
