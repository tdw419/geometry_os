use wgpu::{Device, Queue};
use std::sync::Arc;

/// Executes compiled SPIR-V via wgpu
pub struct GlyphExecutor {
    pub device: Arc<Device>,
    pub queue: Arc<Queue>,
}

impl GlyphExecutor {
    pub async fn new() -> Result<Self, String> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                ..Default::default()
            })
            .await
            .ok_or_else(|| "No suitable GPU adapter found".to_string())?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default(), None)
            .await
            .map_err(|e| format!("Failed to get device: {}", e))?;

        Ok(Self {
            device: Arc::new(device),
            queue: Arc::new(queue),
        })
    }

    /// Check if a GPU is available
    pub async fn is_available() -> bool {
        Self::new().await.is_ok()
    }

    /// Execute a SPIR-V compute shader
    pub async fn execute(&self, spirv_binary: &[u32]) -> Result<(), String> {
        // Create shader module from SPIR-V
        let shader = unsafe {
            self.device.create_shader_module_spirv(&wgpu::ShaderModuleDescriptorSpirV {
                label: Some("Glyph Compiled Shader"),
                source: std::borrow::Cow::Borrowed(spirv_binary),
            })
        };

        // Create minimal compute pipeline
        let pipeline = self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph Pipeline"),
            layout: None,
            module: &shader,
            entry_point: "main",
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Glyph Execution"),
        });

        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph Compute"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&pipeline);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
        
        // Wait for GPU to finish
        self.device.poll(wgpu::Maintain::Wait);

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_executor_creation() {
        let result = GlyphExecutor::new().await;
        // May fail if no GPU, so we just check it doesn't panic
        if let Ok(executor) = result {
            // Check that we have some basic limits
            assert!(executor.device.limits().max_compute_workgroup_storage_size > 0);
        }
    }
}
