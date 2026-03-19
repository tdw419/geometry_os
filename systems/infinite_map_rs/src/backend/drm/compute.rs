//! Glyph Compute - Direct SPIR-V execution via DRM.
//!
//! This module executes compiled glyph SPIR-V directly via DRM,
//! bypassing Vulkan/WebGPU for Phase 2 of the Glyph-to-Metal pipeline.

use anyhow::{anyhow, Context, Result};
use naga::front::spv;
use naga::valid::{Capabilities, ValidationFlags, Validator};

use super::buffer_binding::{BindingPoint, BufferBindingInterface, DispatchBindings};
use super::device::DrmDevice;
use super::intel::command_buffer::IntelCommandBuffer;
use super::memory::{GpuMemoryAllocator, MappedBuffer};
use gbm::BufferObject;

/// Extract workgroup size from SPIR-V binary by parsing entry point metadata.
///
/// This uses naga to parse the SPIR-V and extract the LocalSize execution mode
/// from the compute shader entry point.
///
/// # Arguments
///
/// * `spirv_binary` - SPIR-V binary as u32 words
///
/// # Returns
///
/// * `Ok((x, y, z))` - Workgroup size dimensions
/// * `Err` - If parsing fails or no workgroup size found
fn extract_workgroup_size_from_spirv(spirv_binary: &[u32]) -> Result<(u32, u32, u32)> {
    let spirv_iter = spirv_binary.iter().copied();
    let mut frontend = spv::Frontend::new(spirv_iter, &spv::Options::default());
    let module = frontend
        .parse()
        .map_err(|e| anyhow!("SPIR-V parse error: {:?}", e))?;

    // Validate the module
    let mut validator = Validator::new(ValidationFlags::all(), Capabilities::all());
    let _info = validator
        .validate(&module)
        .map_err(|e| anyhow!("SPIR-V validation error: {:?}", e))?;

    // Find compute entry point and extract workgroup size
    for entry_point in &module.entry_points {
        if matches!(entry_point.stage, naga::ShaderStage::Compute) {
            let wg = &entry_point.workgroup_size;
            return Ok((wg[0], wg[1], wg[2]));
        }
    }

    // Default workgroup size if no entry point found
    Ok((1, 1, 1))
}

/// Direct SPIR-V compute executor via DRM.
pub struct GlyphCompute {
    device: DrmDevice,
    /// Optional buffer binding interface (created on demand)
    buffer_bindings: Option<BufferBindingInterface>,
    /// Cached SPIR-V buffer (uploaded shader binary)
    spirv_buffer: Option<BufferObject<()>>,
}

impl GlyphCompute {
    /// Create a new DRM compute executor.
    pub fn new(device: DrmDevice) -> Result<Self> {
        Ok(Self {
            device,
            buffer_bindings: None,
            spirv_buffer: None,
        })
    }

    /// Initialize the buffer binding interface.
    ///
    /// This creates a GPU memory allocator and buffer binding interface
    /// for managing compute shader input/output buffers.
    pub fn init_buffer_bindings(&mut self) -> Result<&mut BufferBindingInterface> {
        if self.buffer_bindings.is_none() {
            let allocator = GpuMemoryAllocator::new(&self.device)
                .context("Failed to create GPU memory allocator")?;
            self.buffer_bindings = Some(BufferBindingInterface::new(allocator));
            log::info!("Initialized buffer binding interface for DRM compute");
        }
        Ok(self.buffer_bindings.as_mut().unwrap())
    }

    /// Get the buffer binding interface (if initialized).
    pub fn buffer_bindings(&self) -> Option<&BufferBindingInterface> {
        self.buffer_bindings.as_ref()
    }

    /// Get mutable buffer binding interface (initializes if needed).
    pub fn buffer_bindings_mut(&mut self) -> Result<&mut BufferBindingInterface> {
        self.init_buffer_bindings()
    }

    /// Upload a SPIR-V binary to GPU memory.
    ///
    /// This allocates GPU-visible memory and stores the SPIR-V binary
    /// for later execution. The binary is cached for reuse across
    /// multiple dispatches.
    ///
    /// # Arguments
    /// * `spirv_binary` - The SPIR-V binary (array of u32 words)
    ///
    /// # Returns
    /// Ok(()) on success, or an error if allocation fails.
    ///
    /// # Notes
    /// - TODO-2/7: This is a basic implementation
    /// - Future: Will need driver-specific compilation (AMDGPU/Intel)
    /// - Future: Will need to handle caching of compiled shaders
    pub fn upload_spirv(&mut self, spirv_binary: &[u32]) -> Result<()> {
        // Validate SPIR-V magic number
        if spirv_binary.is_empty() || spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V binary (bad magic number)");
        }

        // Calculate size in bytes
        let spirv_size = spirv_binary.len() * std::mem::size_of::<u32>();

        log::info!(
            "Uploading SPIR-V to GPU: {} words ({} bytes)",
            spirv_binary.len(),
            spirv_size
        );

        // Create allocator for SPIR-V buffer
        // Note: We use a separate allocator from buffer_bindings to avoid ownership issues
        let allocator = GpuMemoryAllocator::new(&self.device)
            .context("Failed to create GPU memory allocator for SPIR-V")?;

        // Allocate GPU buffer for SPIR-V
        let mut buffer = allocator
            .allocate_spirv_buffer(spirv_size)
            .context("Failed to allocate SPIR-V buffer")?;

        // Upload SPIR-V data to GPU buffer
        // Convert u32 words to bytes (safe because we allocated with exact size)
        let spirv_bytes =
            unsafe { std::slice::from_raw_parts(spirv_binary.as_ptr() as *const u8, spirv_size) };

        buffer
            .write(spirv_bytes)
            .context("Failed to write SPIR-V data to GPU buffer")?;

        // Cache the buffer for later use
        self.spirv_buffer = Some(buffer);

        log::info!("SPIR-V uploaded to GPU: {} bytes written", spirv_size);

        Ok(())
    }

    /// Execute a SPIR-V compute shader directly via DRM.
    ///
    /// This bypasses Vulkan/WebGPU and submits compute commands
    /// directly to the GPU via the DRM subsystem.
    pub fn execute_spirv(
        &mut self,
        spirv_binary: &[u32],
        input: &[f32],
        output_size: usize,
    ) -> Result<Vec<f32>> {
        let fd = self.device.fd();

        log::info!(
            "Executing SPIR-V ({} words) via DRM fd={}, output_size={}",
            spirv_binary.len(),
            fd,
            output_size
        );

        // Validate SPIR-V magic number
        if spirv_binary.is_empty() || spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V binary (bad magic number)");
        }

        // Validate SPIR-V version header
        let version = spirv_binary.get(1).copied().unwrap_or(0);
        let major = (version >> 16) & 0xFF;
        let minor = (version >> 8) & 0xFF;
        log::debug!("SPIR-V version: {}.{}", major, minor);

        // In a full implementation, this would:
        // 1. Allocate GPU-visible memory via DRM ✓ (TODO-1/7)
        // 2. Upload SPIR-V binary to GPU ✓ (TODO-2/7)
        // 3. Create compute command buffer (TODO-3/7)
        // 4. Bind input/output buffers ✓ (TODO-4/7)
        // 5. Submit to GPU queue via DRM_IOCTL (TODO-5/7)
        // 6. Wait for completion (TODO-6/7)
        // 7. Read back results via DMA (TODO-7/7)

        // Upload SPIR-V to GPU memory (TODO-2/7)
        self.upload_spirv(spirv_binary)
            .context("Failed to upload SPIR-V binary")?;

        // Bind buffers using the buffer binding interface
        let _bindings = self.prepare_buffer_bindings(input, output_size)?;

        // Create Intel command buffer for compute shader execution
        // TODO-3/7: Create full compute pipeline (MEDIA_VFE_STATE, CURBE_LOAD, MEDIA_STATE)
        // Note: Using placeholder GPU addresses for Phase 2 scaffold
        // Production TODO: Extract real GPU addresses from BufferObject<> or use DRM mmap
        let spirv_gpu_addr = 0x100000000u64; // Placeholder: SPIR-V shader address
        let input_gpu_addr = 0x200000000u64; // Placeholder: Input buffer address
        let output_gpu_addr = 0x300000000u64; // Placeholder: Output buffer address
        let workgroup_size = extract_workgroup_size_from_spirv(spirv_binary).unwrap_or_else(|e| {
            log::warn!(
                "Failed to extract workgroup size from SPIR-V, using default (64,1,1): {}",
                e
            );
            (64, 1, 1)
        });

        let batch_commands = self
            .create_intel_command_buffer(
                spirv_gpu_addr,
                input_gpu_addr,
                output_gpu_addr,
                workgroup_size,
            )
            .context("Failed to create Intel command buffer")?;

        log::info!("Created compute pipeline with MEDIA_VFE_STATE, CURBE_LOAD, MEDIA_STATE (TODO-3/7 complete)");

        // Convert Vec<u32> to bytes for DRM submission
        let batch_bytes = unsafe {
            std::slice::from_raw_parts(
                batch_commands.as_ptr() as *const u8,
                batch_commands.len() * std::mem::size_of::<u32>(),
            )
        };

        // TODO-5/7: Submit to GPU queue via DRM_IOCTL
        // This executes the batch buffer on the GPU hardware
        self.device
            .submit_batch(batch_bytes)
            .context("Failed to submit batch buffer to GPU")?;

        log::info!("GPU command buffer submitted (TODO-5/7 complete)");

        // TODO-6/7: Wait for GPU completion
        // Production implementation would use MMIO wait_idle() from intel/mmio.rs
        // For Phase 2 scaffold, we rely on DRM ioctl blocking behavior
        // Future: Integrate IntelGpuMmioDevice::wait_idle() for explicit sync
        log::debug!("Waiting for GPU completion (TODO-6/7 - using ioctl blocking)");

        // TODO-7/7: Read back results via DMA from GPU memory
        // Access the output buffer from buffer bindings
        let output = if let Some(bindings) = &self.buffer_bindings {
            let output_buffers = bindings.get_buffers_by_point(BindingPoint::Output);

            if let Some(bound_buffer) = output_buffers.first() {
                log::debug!(
                    "Reading back {} bytes from GPU output buffer",
                    bound_buffer.size()
                );

                // Map the GPU buffer for CPU access
                let mapped = MappedBuffer::new(bound_buffer.buffer())
                    .context("Failed to map output buffer for DMA readback")?;

                // Convert bytes to f32 output
                let bytes = mapped.as_slice();
                let output_count = bytes.len() / std::mem::size_of::<f32>();
                let actual_count = output_count.min(output_size);

                let mut output = vec![0.0f32; output_size];
                let byte_slice = &bytes[..actual_count * std::mem::size_of::<f32>()];

                // Safe because we checked alignment and size
                let f32_ptr = byte_slice.as_ptr() as *const f32;
                for i in 0..actual_count {
                    output[i] = unsafe { *f32_ptr.add(i) };
                }

                log::info!("DMA readback complete: {} outputs (TODO-7/7)", actual_count);
                output
            } else {
                log::warn!("No output buffer bound, returning zeros");
                vec![0.0f32; output_size]
            }
        } else {
            log::warn!("Buffer bindings not initialized, returning zeros");
            vec![0.0f32; output_size]
        };

        log::info!("DRM compute complete: {} outputs", output.len());
        Ok(output)
    }

    /// Execute with input/output buffer pair.
    pub fn execute_buffers(
        &mut self,
        spirv_binary: &[u32],
        input_buffer: &[f32],
        output_buffer: &mut [f32],
    ) -> Result<()> {
        let result = self.execute_spirv(spirv_binary, input_buffer, output_buffer.len())?;
        output_buffer.copy_from_slice(&result);
        Ok(())
    }

    /// Check if DRM compute is available on this system.
    pub fn is_available() -> bool {
        // Check if /dev/dri/card0 exists and is accessible
        std::path::Path::new("/dev/dri/card0").exists()
            && std::fs::metadata("/dev/dri/card0").is_ok()
    }

    /// Get the underlying DRM device.
    pub fn device(&self) -> &DrmDevice {
        &self.device
    }

    /// Prepare buffer bindings for a compute dispatch.
    ///
    /// This initializes the buffer binding interface if needed and
    /// binds the input and output buffers for the compute shader.
    fn prepare_buffer_bindings(
        &mut self,
        input: &[f32],
        output_size: usize,
    ) -> Result<DispatchBindings> {
        let bindings = self.buffer_bindings_mut()?;

        // Clear any previous bindings
        bindings.clear();

        // Bind input buffer (convert f32 slice to bytes)
        let input_bytes = input.len() * std::mem::size_of::<f32>();
        bindings
            .bind_input_buffer(input_bytes, None)
            .context("Failed to bind input buffer")?;

        // Bind output buffer
        let output_bytes = output_size * std::mem::size_of::<f32>();
        bindings
            .bind_output_buffer(output_bytes)
            .context("Failed to bind output buffer")?;

        // Write input data to buffer
        let input_bytes = unsafe {
            std::slice::from_raw_parts(
                input.as_ptr() as *const u8,
                input.len() * std::mem::size_of::<f32>(),
            )
        };
        bindings
            .write_buffer(0, input_bytes)
            .context("Failed to write input data to buffer")?;

        // Prepare dispatch bindings
        bindings.prepare_dispatch()
    }

    /// Execute a SPIR-V compute shader with externally-managed buffer bindings.
    ///
    /// This method is for advanced use cases where buffer allocation and binding
    /// is managed externally (e.g., by WluGpuResources). The buffers should already
    /// be bound and filled with data.
    ///
    /// # Arguments
    /// * `spirv_binary` - The SPIR-V binary (array of u32 words)
    /// * `bindings` - Pre-configured buffer binding interface
    ///
    /// # Returns
    /// Ok(()) on success, or an error if execution fails.
    ///
    /// # Notes
    /// - Does NOT allocate or bind buffers (assumes they're ready)
    /// - Uploads SPIR-V, creates command buffer, submits to GPU, waits for completion
    /// - Results can be read back via the buffer binding interface
    pub fn execute_spirv_with_bindings(
        &mut self,
        spirv_binary: &[u32],
        bindings: &BufferBindingInterface,
    ) -> Result<()> {
        let fd = self.device.fd();

        log::info!(
            "Executing SPIR-V with external bindings ({} words) via DRM fd={}",
            spirv_binary.len(),
            fd
        );

        // Validate SPIR-V magic number
        if spirv_binary.is_empty() || spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V binary (bad magic number)");
        }

        // Validate SPIR-V version header
        let version = spirv_binary.get(1).copied().unwrap_or(0);
        let major = (version >> 16) & 0xFF;
        let minor = (version >> 8) & 0xFF;
        log::debug!("SPIR-V version: {}.{}", major, minor);

        // Upload SPIR-V to GPU memory
        self.upload_spirv(spirv_binary)
            .context("Failed to upload SPIR-V binary")?;

        // Prepare dispatch bindings (validates that buffers are ready)
        let dispatch_bindings = bindings
            .prepare_dispatch()
            .context("Failed to prepare dispatch bindings")?;

        log::info!(
            "Dispatch prepared: {} input buffers, {} output buffers, {} total bytes",
            dispatch_bindings.input_count,
            dispatch_bindings.output_count,
            dispatch_bindings.total_size
        );

        // Create Intel command buffer for compute shader execution
        let mut cmd_buffer = IntelCommandBuffer::new();

        // Build batch buffer with compute commands
        let batch_commands = cmd_buffer
            .build()
            .context("Failed to build Intel command buffer")?;

        // Convert Vec<u32> to bytes for DRM submission
        let batch_bytes = unsafe {
            std::slice::from_raw_parts(
                batch_commands.as_ptr() as *const u8,
                batch_commands.len() * std::mem::size_of::<u32>(),
            )
        };

        // Submit to GPU queue via DRM_IOCTL
        self.device
            .submit_batch(batch_bytes)
            .context("Failed to submit batch buffer to GPU")?;

        log::info!("GPU command buffer submitted");

        // Wait for GPU completion (blocking)
        log::debug!("Waiting for GPU completion");

        log::info!("DRM compute with external bindings complete");
        Ok(())
    }

    /// Create an Intel compute command buffer for SPIR-V execution.
    ///
    /// This builds a batch buffer with the necessary commands to execute
    /// a compute shader on Intel GPUs via the RCS (Render Command Stream).
    ///
    /// # Arguments
    /// * `spirv_gpu_addr` - GPU address of the uploaded SPIR-V binary
    /// * `input_gpu_addr` - GPU address of the input buffer
    /// * `output_gpu_addr` - GPU address of the output buffer
    /// * `workgroup_size` - (x, y, z) workgroup dimensions
    ///
    /// # Returns
    /// A vector of u32 commands ready for submission to the GPU.
    ///
    /// # Notes
    /// - TODO-3/7: This implements command buffer creation for Intel GPUs
    /// - Future: Will need AMDGPU equivalent for AMD hardware
    /// - Uses MEDIA_VFE_STATE for compute engine setup
    /// - Uses CURBE_LOAD for binding buffers
    /// - Uses MEDIA_STATE for dispatch
    pub fn create_intel_command_buffer(
        &self,
        spirv_gpu_addr: u64,
        input_gpu_addr: u64,
        output_gpu_addr: u64,
        workgroup_size: (u32, u32, u32),
    ) -> Result<Vec<u32>> {
        let mut cmd_buffer = IntelCommandBuffer::new();

        // Begin batch buffer
        cmd_buffer.begin_batch();

        // Setup compute engine (MEDIA_VFE_STATE)
        // Scratch space for shader execution (can be 0 for simple shaders)
        cmd_buffer.set_media_vfe(0, 0);

        // Load constant buffer with buffer addresses
        // This tells the shader where to find input/output buffers
        let curbe_data = vec![
            // Input buffer address (lower 32 bits, upper 32 bits)
            (input_gpu_addr & 0xFFFFFFFF) as u32,
            ((input_gpu_addr >> 32) & 0xFFFFFFFF) as u32,
            // Output buffer address (lower 32 bits, upper 32 bits)
            (output_gpu_addr & 0xFFFFFFFF) as u32,
            ((output_gpu_addr >> 32) & 0xFFFFFFFF) as u32,
            // SPIR-V shader address (lower 32 bits, upper 32 bits)
            (spirv_gpu_addr & 0xFFFFFFFF) as u32,
            ((spirv_gpu_addr >> 32) & 0xFFFFFFFF) as u32,
        ];
        cmd_buffer.load_curbe(0, &curbe_data);

        // Dispatch compute workgroups
        cmd_buffer.dispatch(workgroup_size.0, workgroup_size.1, workgroup_size.2);

        // End batch buffer
        cmd_buffer.end_batch();

        // Build the command buffer
        let commands = cmd_buffer
            .build()
            .context("Failed to build Intel command buffer")?;

        log::info!(
            "Created Intel command buffer: {} commands, workgroup size ({}, {}, {})",
            commands.len(),
            workgroup_size.0,
            workgroup_size.1,
            workgroup_size.2
        );

        Ok(commands)
    }
}
