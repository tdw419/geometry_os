//! Glyph VM Scheduler - GPU-Native Multi-Tasking
//!
//! Manages multiple Glyph VMs running in parallel on GPU via pre-allocated slots.
//! Implements SPATIAL_SPAWN for dynamic VM creation without CPU round-trips.
//!
//! Architecture:
//! - 8 pre-allocated VM slots in GPU memory
//! - Round-robin scheduler runs each VM for 64 cycles/frame
//! - SPATIAL_SPAWN allocates free slots and initializes state
//! - Inter-VM messaging via mailbox queue

use std::sync::Arc;

/// Maximum concurrent VMs
pub const MAX_VMS: usize = 8;

/// VM state constants (must match shader)
pub mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
    pub const WAITING: u32 = 3;
}

/// Single VM configuration
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VmConfig {
    /// Initial program counter (Hilbert index into .rts.png)
    pub entry_point: u32,
    /// Parent VM ID (0xFF = no parent)
    pub parent_id: u32,
    /// Spatial MMU: Start Hilbert index
    pub base_addr: u32,
    /// Spatial MMU: End Hilbert index (0 = unrestricted)
    pub bound_addr: u32,
    /// Initial register values (32 registers)
    pub initial_regs: [u32; 32],
}

impl Default for VmConfig {
    fn default() -> Self {
        Self {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 32],
        }
    }
}

/// VM statistics read back from GPU
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VmStats {
    pub vm_id: u32,
    pub state: u32,
    pub pc: u32,
    pub cycles: u32,
    pub halted: u32,
    pub parent_id: u32,
}

/// Scheduler statistics
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SchedulerStats {
    pub active_count: u32,
    pub frame: u32,
    pub spawn_count: u32,
}

/// Glyph VM Scheduler - manages multi-VM execution on GPU
pub struct GlyphVmScheduler {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,

    /// Compute pipeline for the scheduler
    pipeline: wgpu::ComputePipeline,

    /// Bind group layout
    bind_group_layout: wgpu::BindGroupLayout,

    /// VM state buffer (8 VmState structs)
    vm_buffer: wgpu::Buffer,

    /// Scheduler state buffer
    scheduler_buffer: wgpu::Buffer,

    /// Message queue buffer
    message_buffer: wgpu::Buffer,

    /// Readback buffer for stats
    stats_buffer: wgpu::Buffer,

    /// RAM texture view (.rts.png program memory)
    ram_view: Option<wgpu::TextureView>,
}

impl GlyphVmScheduler {
    /// Create a new Glyph VM Scheduler
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        let shader_source = include_str!("shaders/glyph_vm_scheduler.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Scheduler Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Bind group layout:
        // 0: RAM texture (rgba8uint, read_write)
        // 1: VM states array (storage, read_write)
        // 2: Scheduler state (storage, read_write)
        // 3: Message queue (storage, read_write)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph VM Scheduler Bind Group Layout"),
            entries: &[
                // Binding 0: RAM Texture
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
                // Binding 1: VM States
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
                // Binding 2: Scheduler State
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
                // Binding 3: Message Queue
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
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph VM Scheduler Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Scheduler Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // Create VM state buffer
        // Each VmState is: 32 regs + 12 fields + 64 stack = 108 u32s = 432 bytes
        // Total: 8 * 432 = 3456 bytes
        let vm_buffer_size = 8 * 432;
        let vm_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM States Buffer"),
            size: vm_buffer_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create scheduler state buffer
        let scheduler_buffer_size = 32; // 8 u32s with padding
        let scheduler_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Scheduler State Buffer"),
            size: scheduler_buffer_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create message queue buffer
        // 32 vec4<u32> mailboxes + 8 head + 8 tail = 32*16 + 64 = 576 bytes
        let message_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Message Queue Buffer"),
            size: 576,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create readback buffer for stats
        let stats_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph VM Stats Readback Buffer"),
            size: vm_buffer_size + scheduler_buffer_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        Self {
            device,
            queue,
            pipeline,
            bind_group_layout,
            vm_buffer,
            scheduler_buffer,
            message_buffer,
            stats_buffer,
            ram_view: None,
        }
    }

    /// Set the RAM texture (program memory)
    pub fn set_ram_texture(&mut self, texture: &wgpu::Texture) {
        self.ram_view = Some(texture.create_view(&wgpu::TextureViewDescriptor::default()));
    }

    /// Initialize a VM slot with configuration
    pub fn spawn_vm(&self, vm_id: u32, config: &VmConfig) -> Result<(), String> {
        if vm_id as usize >= MAX_VMS {
            return Err(format!("Invalid VM ID: {} (max: {})", vm_id, MAX_VMS - 1));
        }

        // Build initial VM state
        // VmState layout matches shader:
        // - regs: [u32; 32]
        // - pc, halted, stratum, cycles, stack_ptr, vm_id, state, parent_id, entry_point, padding[2]
        // - stack: [u32; 64]
        let mut vm_data = Vec::with_capacity(108);

        // Copy initial registers
        vm_data.extend_from_slice(&config.initial_regs);

        // Fields
        vm_data.push(config.entry_point); // pc
        vm_data.push(0);                   // halted
        vm_data.push(2);                   // stratum (LOGIC)
        vm_data.push(0);                   // cycles
        vm_data.push(0);                   // stack_ptr
        vm_data.push(vm_id);               // vm_id
        vm_data.push(vm_state::RUNNING);   // state
        vm_data.push(config.parent_id);    // parent_id
        vm_data.push(config.entry_point);  // entry_point
        vm_data.push(config.base_addr);    // base_addr
        vm_data.push(config.bound_addr);   // bound_addr

        // Stack (64 zeros)
        vm_data.extend_from_slice(&[0u32; 64]);

        // Calculate offset in buffer
        let offset = (vm_id as u64) * 432;

        self.queue.write_buffer(&self.vm_buffer, offset, bytemuck::cast_slice(&vm_data));

        // Update scheduler active count (atomic increment would be better but requires shader)
        // For now, we track on CPU side

        log::info!("Spawned VM {} at entry point 0x{:X}", vm_id, config.entry_point);
        Ok(())
    }

    /// Halt a specific VM
    pub fn halt_vm(&self, vm_id: u32) -> Result<(), String> {
        if vm_id as usize >= MAX_VMS {
            return Err(format!("Invalid VM ID: {}", vm_id));
        }

        // Write state = HALTED at offset + 40 (after regs[32] + pc + halted + stratum + cycles + stack_ptr + vm_id)
        let state_offset = (vm_id as u64) * 432 + 40;
        let halted_data: [u32; 2] = [vm_state::HALTED, 1]; // state, halted
        self.queue.write_buffer(&self.vm_buffer, state_offset, bytemuck::cast_slice(&halted_data));

        log::info!("Halted VM {}", vm_id);
        Ok(())
    }

    /// Execute one frame of the scheduler
    pub fn execute_frame(&self) {
        let ram_view = match &self.ram_view {
            Some(view) => view,
            None => {
                log::warn!("No RAM texture set for Glyph VM Scheduler");
                return;
            }
        };

        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph VM Scheduler Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(ram_view),
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
                    resource: self.message_buffer.as_entire_binding(),
                },
            ],
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Glyph VM Scheduler Encoder"),
        });

        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph VM Scheduler Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(std::iter::once(encoder.finish()));
    }

    /// Read VM statistics from GPU
    pub fn read_stats(&self) -> Vec<VmStats> {
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Glyph VM Stats Read Encoder"),
        });

        // Copy VM buffer to readback buffer
        encoder.copy_buffer_to_buffer(&self.vm_buffer, 0, &self.stats_buffer, 0, 3456);

        self.queue.submit(std::iter::once(encoder.finish()));

        // Note: Actual readback requires async mapping in wgpu
        // For now, return empty stats (real implementation would use callback)
        Vec::new()
    }

    /// Reset all VMs to inactive state
    pub fn reset_all(&self) {
        // Zero out VM buffer
        let zeros = vec![0u32; 8 * 108];
        self.queue.write_buffer(&self.vm_buffer, 0, bytemuck::cast_slice(&zeros));

        // Reset scheduler state
        let scheduler_init: [u32; 8] = [0, 0, 0, 0, 0, 0, 0, 0];
        self.queue.write_buffer(&self.scheduler_buffer, 0, bytemuck::cast_slice(&scheduler_init));

        log::info!("Reset all Glyph VMs");
    }

    /// Get the bind group layout for external use
    pub fn bind_group_layout(&self) -> &wgpu::BindGroupLayout {
        &self.bind_group_layout
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vm_config_default() {
        let config = VmConfig::default();
        assert_eq!(config.entry_point, 0);
        assert_eq!(config.parent_id, 0xFF);
    }

    #[test]
    fn test_vm_state_constants() {
        assert_eq!(vm_state::INACTIVE, 0);
        assert_eq!(vm_state::RUNNING, 1);
        assert_eq!(vm_state::HALTED, 2);
        assert_eq!(vm_state::WAITING, 3);
    }
}
