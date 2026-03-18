//! Glyph VM Executor - Bare-metal Geometry OS Execution
//!
//! This module provides the absolute minimal Rust bridge required to
//! execute Glyph programs directly on the GPU using the glyph_vm.wgsl kernel.

use anyhow::Result;
use std::sync::Arc;
use wgpu::util::DeviceExt;

/// Minimal state for the Glyph VM (matches WGSL struct)
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct GlyphVmState {
    pub regs: [u32; 32],
    pub pc: u32,
    pub halted: u32,
    pub stratum: u32,
    pub cycles: u32,
    pub stack_ptr: u32,
    pub stack: [u32; 64],
}

/// Visual Interaction Bus header (matches WGSL InputBusHeader)
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VibHeader {
    pub magic: u32,
    pub mouse_x: f32,
    pub mouse_y: f32,
    pub mouse_btn: u32,
    pub kb_head: u32,
    pub kb_tail: u32,
    pub kb_cap: u32,
    pub _pad: u32,
}

/// KeyEvent entry in VIB FIFO (matches WGSL KeyEventEntry)
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct KeyEventEntry {
    pub code: u32,
    pub state: u32,
    pub mods: u32,
    pub timestamp: u32,
}

/// VIB capacity: 8 header u32s + 64 key events * 4 u32s = 264 u32s = 1056 bytes
const VIB_CAPACITY_U32: usize = 8 + (64 * 4);
const VIB_MAGIC: u32 = 0x5649_4200; // "VIB\0"

impl Default for GlyphVmState {
    fn default() -> Self {
        Self {
            regs: [0; 32],
            pc: 0,
            halted: 0,
            stratum: 0,
            cycles: 0,
            stack_ptr: 0,
            stack: [0; 64],
        }
    }
}

pub struct GlyphVmExecutor {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    pipeline: wgpu::ComputePipeline,
    bind_group_layout: wgpu::BindGroupLayout,
    state_buffer: wgpu::Buffer,
    vib_buffer: wgpu::Buffer,
}

impl GlyphVmExecutor {
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Result<Self> {
        // Load the Glyph VM shader
        let shader_source = include_str!("../../shaders/glyph_vm.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph VM Bind Group Layout"),
            entries: &[
                // Binding 0: Storage Texture (RAM)
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
                // Binding 1: Storage Buffer (VM State)
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
                // Binding 9: Visual Interaction Bus (VIB)
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

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph VM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // Initialize state buffer
        let state = GlyphVmState::default();
        let state_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph VM State Buffer"),
            contents: bytemuck::cast_slice(&[state]),
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
        });

        // Initialize VIB buffer (Visual Interaction Bus)
        let vib_data: [u32; VIB_CAPACITY_U32] = [0u32; VIB_CAPACITY_U32];
        let vib_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph VM VIB Buffer"),
            contents: bytemuck::cast_slice(&vib_data),
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
        });

        Ok(Self {
            device,
            queue,
            pipeline,
            bind_group_layout,
            state_buffer,
            vib_buffer,
        })
    }

    /// Execute one or more cycles of the Glyph VM
    pub fn step(&self, ram_view: &wgpu::TextureView, cycles: u32) -> Result<GlyphVmState> {
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph VM Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(ram_view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: self.state_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 9,
                    resource: self.vib_buffer.as_entire_binding(),
                },
            ],
        });

        for _ in 0..cycles {
            let mut encoder = self
                .device
                .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                    label: Some("Glyph VM Step"),
                });
            {
                let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some("Glyph VM Pass"),
                    timestamp_writes: None,
                });
                compute_pass.set_pipeline(&self.pipeline);
                compute_pass.set_bind_group(0, &bind_group, &[]);
                compute_pass.dispatch_workgroups(1, 1, 1);
            }
            self.queue.submit(std::iter::once(encoder.finish()));
        }

        // Read back state
        let staging_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM State Staging"),
            size: std::mem::size_of::<GlyphVmState>() as u64,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
        encoder.copy_buffer_to_buffer(
            &self.state_buffer,
            0,
            &staging_buffer,
            0,
            staging_buffer.size(),
        );
        self.queue.submit(std::iter::once(encoder.finish()));

        let slice = staging_buffer.slice(..);
        let (tx, rx) = futures_intrusive::channel::shared::oneshot_channel();
        slice.map_async(wgpu::MapMode::Read, move |v| tx.send(v).unwrap());
        self.device.poll(wgpu::Maintain::Wait);

        pollster::block_on(rx.receive()).unwrap()?;
        let data = slice.get_mapped_range();
        let state: GlyphVmState = *bytemuck::from_bytes(&data);
        drop(data);
        staging_buffer.unmap();

        Ok(state)
    }

    /// Update the Visual Interaction Bus with mouse state
    pub fn update_vib(&self, mouse_x: f32, mouse_y: f32, mouse_btn: u32) {
        let mut vib_data: [u32; VIB_CAPACITY_U32] = [0u32; VIB_CAPACITY_U32];

        // Write header (matches VibHeader struct layout)
        vib_data[0] = VIB_MAGIC;
        // mouse_x at index 1 (reinterpret f32 as u32)
        vib_data[1] = mouse_x.to_bits();
        // mouse_y at index 2
        vib_data[2] = mouse_y.to_bits();
        // mouse_btn at index 3
        vib_data[3] = mouse_btn;
        // kb_head, kb_tail, kb_cap at 4, 5, 6 (all 0 for no keyboard events)
        vib_data[6] = 64; // kb_cap = 64 events

        self.queue
            .write_buffer(&self.vib_buffer, 0, bytemuck::cast_slice(&vib_data));
    }

    /// Push a keyboard event to the VIB FIFO
    pub fn push_key_event(&self, code: u32, pressed: bool, mods: u32) {
        // Read current VIB state
        let header_size = 8 * std::mem::size_of::<u32>();
        let mut vib_data: [u32; VIB_CAPACITY_U32] = [0u32; VIB_CAPACITY_U32];

        // We need to read-modify-write, but for simplicity just write the event
        // In a real implementation, you'd read the buffer first
        let kb_head = 0u32;
        let kb_tail = 0u32;
        let kb_cap = 64u32;

        // Write header
        vib_data[0] = VIB_MAGIC;
        vib_data[4] = kb_head;
        vib_data[5] = (kb_tail + 1) % kb_cap; // Advance tail by 1
        vib_data[6] = kb_cap;

        // Write key event at FIFO slot 0 (indices 8-11)
        vib_data[8] = code;
        vib_data[9] = if pressed { 1 } else { 0 };
        vib_data[10] = mods;
        vib_data[11] = 0; // timestamp (could use std::time)

        self.queue
            .write_buffer(&self.vib_buffer, 0, bytemuck::cast_slice(&vib_data));
    }
}
