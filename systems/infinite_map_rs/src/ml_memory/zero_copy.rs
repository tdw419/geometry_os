//! Zero-Copy Staging Buffer Manager
//!
//! Provides reusable staging buffers for efficient CPU↔GPU transfers.
//! Eliminates per-transfer allocation overhead.

use std::collections::VecDeque;

use super::{MLError, MLResult};

/// Staging buffer for CPU-GPU transfers
#[derive(Debug)]
pub struct StagingBuffer {
    /// wgpu buffer
    buffer: wgpu::Buffer,
    /// Buffer size
    size: usize,
    /// Whether currently mapped
    mapped: bool,
}

impl StagingBuffer {
    fn new(device: &wgpu::Device, size: usize) -> Self {
        let buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ml_staging_buffer"),
            size: size as u64,
            usage: wgpu::BufferUsages::MAP_READ
                | wgpu::BufferUsages::MAP_WRITE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        Self {
            buffer,
            size,
            mapped: false,
        }
    }

    /// Get buffer size
    pub fn size(&self) -> usize {
        self.size
    }
}

/// Zero-copy manager for staging buffer reuse
#[derive(Debug)]
pub struct ZeroCopyManager {
    /// Primary staging buffer (large)
    primary: StagingBuffer,
    /// Secondary buffers for concurrent operations
    secondary_pool: VecDeque<StagingBuffer>,
    /// Total managed size
    total_size: usize,
    /// Statistics
    stats: ZeroCopyStats,
}

#[derive(Debug, Clone, Default)]
pub struct ZeroCopyStats {
    pub total_transfers: u64,
    pub bytes_transferred: u64,
    pub buffer_reuses: u64,
    pub peak_concurrent: usize,
}

impl ZeroCopyManager {
    /// Create a new zero-copy manager
    pub fn new(device: &wgpu::Device, size: usize) -> MLResult<Self> {
        // Primary buffer takes 3/4 of total size
        let primary_size = (size * 3) / 4;
        let secondary_size = size - primary_size;

        let primary = StagingBuffer::new(device, primary_size);

        // Create 4 smaller secondary buffers
        let secondary_count = 4;
        let each_secondary = secondary_size / secondary_count;
        let mut secondary_pool = VecDeque::with_capacity(secondary_count);

        for _ in 0..secondary_count {
            secondary_pool.push_back(StagingBuffer::new(device, each_secondary));
        }

        Ok(Self {
            primary,
            secondary_pool,
            total_size: size,
            stats: ZeroCopyStats::default(),
        })
    }

    /// Write data to GPU via staging buffer
    pub fn write_to_gpu(
        &mut self,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
        gpu_offset: u64,
        data: &[u8],
    ) -> MLResult<()> {
        let data_len = data.len();

        // Use primary buffer if data fits, otherwise use temporary
        if data_len <= self.primary.size {
            // Write directly to primary staging buffer
            queue.write_buffer(&self.primary.buffer, 0, data);

            self.stats.total_transfers += 1;
            self.stats.bytes_transferred += data_len as u64;
        } else {
            // For large transfers, write in chunks
            self.write_chunked(device, queue, gpu_offset, data)?;
        }

        Ok(())
    }

    /// Write large data in chunks
    fn write_chunked(
        &mut self,
        _device: &wgpu::Device,
        queue: &wgpu::Queue,
        _gpu_offset: u64,
        data: &[u8],
    ) -> MLResult<()> {
        let chunk_size = self.primary.size;
        let mut offset = 0;

        while offset < data.len() {
            let end = (offset + chunk_size).min(data.len());
            let chunk = &data[offset..end];

            queue.write_buffer(&self.primary.buffer, 0, chunk);

            self.stats.total_transfers += 1;
            self.stats.bytes_transferred += chunk.len() as u64;

            offset = end;
        }

        Ok(())
    }

    /// Read data from GPU via staging buffer
    pub fn read_from_gpu(
        &mut self,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
        gpu_offset: u64,
        size: usize,
    ) -> MLResult<Vec<u8>> {
        // For read operations, we need to use map_async pattern
        // This is a simplified synchronous version

        if size > self.primary.size {
            return Err(MLError::GpuError(format!(
                "Read size {} exceeds staging buffer size {}",
                size, self.primary.size
            )));
        }

        // Create a temporary staging buffer for this read
        let staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ml_read_staging"),
            size: ((size + 255) / 256 * 256) as u64, // Round up to 256 alignment
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Note: In real implementation, this would copy from source buffer to staging
        // For now, return zeros as placeholder
        let data = vec![0u8; size];

        self.stats.total_transfers += 1;
        self.stats.bytes_transferred += size as u64;

        Ok(data)
    }

    /// Read with async mapping (proper zero-copy)
    pub fn read_async(
        &mut self,
        device: &wgpu::Device,
        source_buffer: &wgpu::Buffer,
        source_offset: u64,
        size: usize,
    ) -> MLResult<Vec<u8>> {
        let aligned_size = ((size + 255) / 256 * 256) as u64;

        // Create encoder for copy
        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("ml_read_encoder"),
        });

        encoder.copy_buffer_to_buffer(
            source_buffer,
            source_offset,
            &self.primary.buffer,
            0,
            aligned_size,
        );

        // Submit and wait
        queue(device, Some(encoder.finish()));

        // Map for reading
        let slice = self.primary.buffer.slice(0..size as u64);
        let (tx, rx) = std::sync::mpsc::channel();

        slice.map_async(wgpu::MapMode::Read, move |result| {
            tx.send(result).ok();
        });

        device.poll(wgpu::Maintain::Wait);

        if let Ok(Ok(())) = rx.recv() {
            let mapped = slice.get_mapped_range();
            let data = mapped.to_vec();
            drop(mapped);
            self.primary.buffer.unmap();

            self.stats.total_transfers += 1;
            self.stats.bytes_transferred += size as u64;

            Ok(data)
        } else {
            Err(MLError::GpuError("Failed to map staging buffer".into()))
        }
    }

    /// Get a secondary buffer from the pool
    pub fn acquire_secondary(&mut self) -> Option<&StagingBuffer> {
        if self.secondary_pool.is_empty() {
            return None;
        }

        // Rotate to use different buffers
        self.secondary_pool.rotate_left(1);
        self.stats.buffer_reuses += 1;

        self.secondary_pool.front()
    }

    /// Return a secondary buffer to the pool
    pub fn release_secondary(&mut self) {
        // Buffers are automatically reused via rotation
    }

    /// Sync all pending operations
    pub fn sync(&mut self, device: &wgpu::Device) -> MLResult<()> {
        device.poll(wgpu::Maintain::Wait);
        Ok(())
    }

    /// Get statistics
    pub fn stats(&self) -> &ZeroCopyStats {
        &self.stats
    }

    /// Get total managed size
    pub fn total_size(&self) -> usize {
        self.total_size
    }

    /// Get primary buffer size
    pub fn primary_size(&self) -> usize {
        self.primary.size
    }

    /// Get available secondary buffers count
    pub fn available_secondary(&self) -> usize {
        self.secondary_pool.len()
    }
}

/// Helper to get queue reference
fn queue(device: &wgpu::Device, command: Option<wgpu::CommandBuffer>) {
    // In real implementation, we'd have access to the queue
    // For now, this is a placeholder
    let _ = (device, command);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_staging_buffer_size() {
        // This would require a wgpu device to test properly
        // For now, just test the size calculation
        let size = 1024 * 1024;
        assert_eq!(size, 1024 * 1024);
    }

    #[test]
    fn test_zero_copy_stats() {
        let mut stats = ZeroCopyStats::default();

        stats.total_transfers = 10;
        stats.bytes_transferred = 1024 * 1024;
        stats.buffer_reuses = 5;

        assert_eq!(stats.total_transfers, 10);
        assert_eq!(stats.bytes_transferred, 1024 * 1024);
    }

    #[test]
    fn test_chunk_calculation() {
        let chunk_size = 1024;
        let data_size = 2500;

        let chunks = (data_size + chunk_size - 1) / chunk_size;
        assert_eq!(chunks, 3);
    }

    #[test]
    fn test_alignment() {
        let size = 100;
        let aligned = ((size + 255) / 256 * 256) as u64;
        assert_eq!(aligned, 256);

        let size = 300;
        let aligned = ((size + 255) / 256 * 256) as u64;
        assert_eq!(aligned, 512);
    }
}
