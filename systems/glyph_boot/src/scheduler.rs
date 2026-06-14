//! Glyph VM Scheduler - Minimal GPU Compute Scheduler
//!
//! Executes glyph programs on GPU with pre-allocated VM slots.

use std::sync::Arc;

use super::rts_loader::RtsLoader;

const MAX_VMS: usize = 8;
const MAX_CYCLES_PER_VM: u32 = 64;
const REG_COUNT: usize = 32;
const STACK_SIZE: usize = 64;

/// VM state constants (must match shader)
mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
}

/// Scheduler statistics
pub struct SchedulerStats {
    pub active_vms: u32,
    pub total_cycles: u64,
    pub frame: u32,
}

/// Glyph VM Scheduler
pub struct GlyphScheduler {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,

    /// Compute pipeline for VM execution
    pipeline: wgpu::ComputePipeline,

    /// Bind group layout
    bind_group_layout: wgpu::BindGroupLayout,

    /// RAM texture (the glyph program)
    ram_texture: wgpu::Texture,
    ram_view: wgpu::TextureView,

    /// VM state buffer
    vm_buffer: wgpu::Buffer,

    /// Scheduler state buffer
    scheduler_buffer: wgpu::Buffer,

    /// Message queue buffer (binding 3)
    messages_buffer: wgpu::Buffer,

    /// Event queue header buffer (binding 4)
    event_header_buffer: wgpu::Buffer,

    /// Event queue buffer (binding 5)
    event_queue_buffer: wgpu::Buffer,

    /// Screen texture (output)
    screen_texture: wgpu::Texture,
    screen_view: wgpu::TextureView,

    /// Current bind group
    bind_group: Option<wgpu::BindGroup>,
}

impl GlyphScheduler {
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>, rts: RtsLoader) -> Self {
        // Load shader
        let shader_source = include_str!("shaders/glyph_vm_scheduler.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Scheduler Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph Scheduler Bind Group Layout"),
            entries: &[
                // 0: RAM texture (read_write)
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::ReadWrite,
                        format: wgpu::TextureFormat::Rgba8Uint,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                // 1: VM states
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
                // 2: Scheduler state
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
                // 3: Message queue (read_write)
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
                // 4: Event header (read_only - matches shader)
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // 5: Event queue (read_only)
                wgpu::BindGroupLayoutEntry {
                    binding: 5,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline
        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph Scheduler Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph Scheduler Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // Take ownership of RAM texture from RTS loader
        let ram_texture = rts.texture;
        let ram_view = ram_texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Create VM buffer (8 VMs * 108 u32 each)
        let vm_buffer_size = (MAX_VMS * 108 * 4) as u64;
        let vm_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("VM States Buffer"),
            size: vm_buffer_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create scheduler buffer
        let scheduler_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Scheduler State Buffer"),
            size: 32,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create message queue buffer
        let messages_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Message Queue Buffer"),
            size: 4096, // Message queue size
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create event header buffer
        let event_header_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Event Header Buffer"),
            size: 16,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create event queue buffer
        let event_queue_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Event Queue Buffer"),
            size: 1024 * 40, // 1024 events * 40 bytes each
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create screen texture
        let screen_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Screen Texture"),
            size: wgpu::Extent3d { width: 1920, height: 1080, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Bgra8Unorm,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        });
        let screen_view = screen_texture.create_view(&wgpu::TextureViewDescriptor::default());

        Self {
            device,
            queue,
            pipeline,
            bind_group_layout,
            ram_texture,
            ram_view,
            vm_buffer,
            scheduler_buffer,
            messages_buffer,
            event_header_buffer,
            event_queue_buffer,
            screen_texture,
            screen_view,
            bind_group: None,
        }
    }

    /// Spawn a VM at the given entry point
    pub fn spawn_vm(&mut self, vm_id: u32, entry_point: u32) {
        if vm_id as usize >= MAX_VMS {
            log::error!("Invalid VM ID: {}", vm_id);
            return;
        }

        // Build VM state
        let mut vm_data = Vec::with_capacity(108);

        // 32 registers (all zero)
        vm_data.extend_from_slice(&[0u32; 32]);

        // Fields
        vm_data.push(entry_point);     // pc
        vm_data.push(0);               // halted
        vm_data.push(2);               // stratum (LOGIC)
        vm_data.push(0);               // cycles
        vm_data.push(0);               // stack_ptr
        vm_data.push(vm_id);           // vm_id
        vm_data.push(vm_state::RUNNING); // state
        vm_data.push(0xFF);            // parent_id
        vm_data.push(entry_point);     // entry_point
        vm_data.push(0);               // base_addr
        vm_data.push(0);               // bound_addr

        // Stack (64 zeros)
        vm_data.extend_from_slice(&[0u32; 64]);

        // Write to buffer at correct offset
        let offset = (vm_id as u64) * 108 * 4;
        self.queue.write_buffer(&self.vm_buffer, offset, bytemuck::cast_slice(&vm_data));

        log::info!("[SCHED] Spawned VM #{} at entry 0x{:X}", vm_id, entry_point);
    }

    /// Execute one frame
    pub fn execute_frame(&mut self) {
        // Create bind group if needed
        if self.bind_group.is_none() {
            self.bind_group = Some(self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some("Glyph Scheduler Bind Group"),
                layout: &self.bind_group_layout,
                entries: &[
                    wgpu::BindGroupEntry {
                        binding: 0,
                        resource: wgpu::BindingResource::TextureView(&self.ram_view),
                    },
                    wgpu::BindGroupEntry {
                        binding: 1,
                        resource: self.vm_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 2,
                        resource: self.scheduler_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 3,
                        resource: self.messages_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 4,
                        resource: self.event_header_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 5,
                        resource: self.event_queue_buffer.as_entire_binding(),
                    },
                ],
            }));
        }

        let bind_group = self.bind_group.as_ref().unwrap();

        // Create command encoder
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Glyph Scheduler Frame"),
        });

        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph VM Execution"),
                timestamp_writes: None,
            });

            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(std::iter::once(encoder.finish()));
    }

    /// Get scheduler statistics
    pub fn get_stats(&self) -> SchedulerStats {
        // In a real implementation, we'd read back from GPU
        // For now, return placeholder
        SchedulerStats {
            active_vms: 1,
            total_cycles: 0,
            frame: 0,
        }
    }
}
