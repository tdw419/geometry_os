#![allow(dead_code, unused_imports, unused_variables)]
//! Visual Feedback Encoder - Captures and Encodes Visual Output
//!
//! This module captures the rendered thought geometry as a texture, encodes it
//! to a compact binary format, and sends it back to the Evolution Daemon via
//! the socket connection, enabling the daemon to "see" its own output.

use crate::evolution_protocol::{ProtocolMessage, MessageType, EvolutionClient};
use wgpu::{self, Device, Queue, Texture, TextureView, ImageCopyTexture, ImageDataLayout, Extent3d, TextureFormat, TextureUsages};
use std::sync::{Arc, Mutex};
use std::io;
use std::time::{Duration, Instant};
use serde::{Deserialize, Serialize};

/// Visual feedback data structure
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VisualFeedbackData {
    pub feedback_id: u64,
    pub timestamp: f64,
    pub width: u32,
    pub height: u32,
    pub format: String,
    pub compression: String,
    pub data_size: usize,
    pub metrics: VisualFeedbackMetrics,
}

/// Visual feedback metrics
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VisualFeedbackMetrics {
    pub avg_brightness: f32,
    pub avg_contrast: f32,
    pub color_distribution: [f32; 3], // RGB distribution
    pub thought_density: f32,
    pub geometry_complexity: f32,
}

/// Visual feedback encoder configuration
#[allow(dead_code)]
pub struct VisualFeedbackConfig {
    pub enabled: bool,
    pub compression_level: u8,
    pub downsample_factor: u32,
    pub include_metrics: bool,
    pub max_frame_rate: f32,
    pub quality: f32,
}

impl Default for VisualFeedbackConfig {
    fn default() -> Self {
        Self {
            enabled: true,
            compression_level: 6,
            downsample_factor: 4,
            include_metrics: true,
            max_frame_rate: 10.0, // 10 FPS
            quality: 0.85,
        }
    }
}

/// Visual feedback encoder - captures and encodes rendered output
pub struct VisualFeedbackEncoder {
    device: Arc<Device>,
    queue: Arc<Queue>,
    client: Arc<Mutex<EvolutionClient>>,
    config: VisualFeedbackConfig,
    
    // Feedback texture
    feedback_texture: Option<Texture>,
    feedback_view: Option<TextureView>,
    
    // State
    last_feedback: Instant,
    feedback_interval: Duration,
    feedback_count: u64,
    
    // Metrics
    last_metrics: Option<VisualFeedbackMetrics>,
}

impl VisualFeedbackEncoder {
    /// Create a new visual feedback encoder
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        client: Arc<Mutex<EvolutionClient>>,
        config: VisualFeedbackConfig,
    ) -> Self {
        let feedback_interval = Duration::from_secs_f64(1.0 / config.max_frame_rate as f64);
        
        Self {
            device,
            queue,
            client,
            config,
            feedback_texture: None,
            feedback_view: None,
            last_feedback: Instant::now(),
            feedback_interval,
            feedback_count: 0,
            last_metrics: None,
        }
    }
    
    /// Initialize the feedback encoder
    pub fn initialize(&mut self, width: u32, height: u32) {
        let downsampled_width = width / self.config.downsample_factor;
        let downsampled_height = height / self.config.downsample_factor;
        
        let size = Extent3d {
            width: downsampled_width.max(1),
            height: downsampled_height.max(1),
            depth_or_array_layers: 1,
        };
        
        let texture = self.device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Visual Feedback Texture"),
            size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: TextureFormat::Rgba8UnormSrgb,
            usage: TextureUsages::RENDER_ATTACHMENT | TextureUsages::COPY_SRC | TextureUsages::COPY_DST | TextureUsages::TEXTURE_BINDING,
            view_formats: &[],
        });
        
        let view = texture.create_view(&wgpu::TextureViewDescriptor::default());
        
        self.feedback_texture = Some(texture);
        self.feedback_view = Some(view);
    }
    
    /// Capture visual feedback from a texture
    pub fn capture_feedback(&mut self, source_texture: &Texture) -> io::Result<Vec<u8>> {
        let feedback_texture = self.feedback_texture.as_ref().ok_or_else(|| {
            io::Error::new(io::ErrorKind::NotConnected, "Feedback texture not initialized")
        })?;
        
        let size = feedback_texture.size();
        
        // Calculate padded bytes per row (must be multiple of 256)
        let unpadded_bytes_per_row = size.width * 4;
        let align = 256;
        let padding = (align - unpadded_bytes_per_row % align) % align;
        let padded_bytes_per_row = unpadded_bytes_per_row + padding;
        
        // Create buffer for reading texture data
        let buffer_size = (padded_bytes_per_row * size.height) as u64;
        let buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Feedback Read Buffer"),
            size: buffer_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        
        // Copy from source texture to feedback texture (with downsampling)
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Feedback Capture Encoder"),
        });
        
        let copy_size = Extent3d {
            width: size.width.min(source_texture.width()),
            height: size.height.min(source_texture.height()),
            depth_or_array_layers: 1,
        };

        // For now, we'll do a simple blit (in production, use proper downsampling)
        encoder.copy_texture_to_texture(
            ImageCopyTexture {
                texture: source_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            ImageCopyTexture {
                texture: feedback_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            copy_size,
        );
        
        // Copy texture to buffer
        encoder.copy_texture_to_buffer(
            ImageCopyTexture {
                texture: feedback_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            wgpu::ImageCopyBuffer {
                buffer: &buffer,
                layout: ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(padded_bytes_per_row),
                    rows_per_image: None,
                },
            },
            size,
        );
        
        self.queue.submit(Some(encoder.finish()));
        
        // Read buffer data
        let buffer_slice = buffer.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        
        buffer_slice.map_async(wgpu::MapMode::Read, move |result| {
            tx.send(result).unwrap();
        });
        
        self.device.poll(wgpu::MaintainBase::Wait);
        
        rx.recv().unwrap().map_err(|e| io::Error::new(io::ErrorKind::Other, format!("Buffer map failed: {:?}", e)))?;
        
        let padded_data = buffer_slice.get_mapped_range().to_vec();
        
        // Unpad data
        let mut data = Vec::with_capacity((size.width * size.height * 4) as usize);
        for i in 0..size.height {
            let start = (i * padded_bytes_per_row) as usize;
            let end = start + unpadded_bytes_per_row as usize;
            data.extend_from_slice(&padded_data[start..end]);
        }
        
        // Calculate metrics
        let metrics = self.calculate_metrics(&data, size.width, size.height);
        self.last_metrics = Some(metrics.clone());
        
        // Encode data
        let encoded = self.encode_data(&data)?;
        
        Ok(encoded)
    }
    
    /// Calculate visual feedback metrics
    fn calculate_metrics(&self, data: &[u8], _width: u32, _height: u32) -> VisualFeedbackMetrics {
        let mut total_brightness = 0.0f32;
        let mut color_dist = [0.0f32; 3];
        let mut pixel_count = 0u32;
        
        for chunk in data.chunks_exact(4) {
            let r = chunk[0] as f32 / 255.0;
            let g = chunk[1] as f32 / 255.0;
            let b = chunk[2] as f32 / 255.0;
            
            total_brightness += (r + g + b) / 3.0;
            color_dist[0] += r;
            color_dist[1] += g;
            color_dist[2] += b;
            
            pixel_count += 1;
        }
        
        if pixel_count > 0 {
            let avg_brightness = total_brightness / pixel_count as f32;
            
            // Calculate contrast (simplified)
            let mut contrast_sum = 0.0f32;
            for chunk in data.chunks_exact(4) {
                let r = chunk[0] as f32 / 255.0;
                let g = chunk[1] as f32 / 255.0;
                let b = chunk[2] as f32 / 255.0;
                let brightness = (r + g + b) / 3.0;
                contrast_sum += (brightness - avg_brightness).abs();
            }
            let avg_contrast = contrast_sum / pixel_count as f32;
            
            // Normalize color distribution
            color_dist[0] /= pixel_count as f32;
            color_dist[1] /= pixel_count as f32;
            color_dist[2] /= pixel_count as f32;
            
            VisualFeedbackMetrics {
                avg_brightness,
                avg_contrast,
                color_distribution: color_dist,
                thought_density: avg_brightness, // Simplified
                geometry_complexity: avg_contrast, // Simplified
            }
        } else {
            VisualFeedbackMetrics {
                avg_brightness: 0.0,
                avg_contrast: 0.0,
                color_distribution: [0.0, 0.0, 0.0],
                thought_density: 0.0,
                geometry_complexity: 0.0,
            }
        }
    }
    
    /// Encode data to compact binary format
    fn encode_data(&self, data: &[u8]) -> io::Result<Vec<u8>> {
        // Simple RLE (Run-Length Encoding) for compression
        let mut encoded = Vec::new();
        let mut i = 0;
        
        while i < data.len() {
            let byte = data[i];
            let mut count = 1u8;
            
            while i + (count as usize) < data.len() && data[i + (count as usize)] == byte && count < 255 {
                count += 1;
            }
            
            encoded.push(count);
            encoded.push(byte);
            i += count as usize;
        }
        
        Ok(encoded)
    }
    
    /// Send visual feedback to evolution daemon
    pub fn send_feedback(&mut self, feedback_data: &VisualFeedbackData, encoded_data: &[u8]) -> io::Result<()> {
        if !self.config.enabled {
            return Ok(());
        }
        
        let mut client = self.client.lock().unwrap();
        
        // Create message payload
        let payload = serde_json::json!({
            "feedback": feedback_data,
            "data": base64::encode(encoded_data),
        });
        
        self.feedback_count += 1;
        let msg = ProtocolMessage::new(
            MessageType::VisualThoughtReady,
            self.feedback_count,
            payload,
        );
        
        client.send_message(msg)?;
        
        log::debug!("📤 Sent visual feedback #{}", self.feedback_count);
        
        Ok(())
    }
    
    /// Update feedback encoder (call this periodically)
    pub fn update(&mut self, source_texture: &Texture) -> io::Result<()> {
        let now = Instant::now();
        
        // Ensure initialized with correct size
        let size = source_texture.size();
        if self.feedback_texture.is_none() || 
           self.feedback_texture.as_ref().unwrap().width() != size.width / self.config.downsample_factor ||
           self.feedback_texture.as_ref().unwrap().height() != size.height / self.config.downsample_factor {
            self.initialize(size.width, size.height);
        }

        // Only send feedback at specified interval
        if now.duration_since(self.last_feedback) < self.feedback_interval {
            return Ok(());
        }
        
        self.last_feedback = now;
        
        // Capture feedback
        let encoded_data = self.capture_feedback(source_texture)?;
        
        // Create feedback data structure
        let feedback_data = VisualFeedbackData {
            feedback_id: self.feedback_count,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_secs_f64(),
            width: source_texture.width(),
            height: source_texture.height(),
            format: "RGBA8".to_string(),
            compression: "RLE".to_string(),
            data_size: encoded_data.len(),
            metrics: self.last_metrics.clone().unwrap_or_else(|| VisualFeedbackMetrics {
                avg_brightness: 0.0,
                avg_contrast: 0.0,
                color_distribution: [0.0, 0.0, 0.0],
                thought_density: 0.0,
                geometry_complexity: 0.0,
            }),
        };
        
        // Send feedback
        self.send_feedback(&feedback_data, &encoded_data)?;
        
        Ok(())
    }
    
    /// Get last metrics
    pub fn get_last_metrics(&self) -> Option<&VisualFeedbackMetrics> {
        self.last_metrics.as_ref()
    }
    
    /// Get feedback count
    pub fn get_feedback_count(&self) -> u64 {
        self.feedback_count
    }
    
    /// Enable/disable feedback
    pub fn set_enabled(&mut self, enabled: bool) {
        self.config.enabled = enabled;
    }
    
    /// Check if enabled
    pub fn is_enabled(&self) -> bool {
        self.config.enabled
    }
    
    /// Set max frame rate
    pub fn set_max_frame_rate(&mut self, fps: f32) {
        self.config.max_frame_rate = fps.max(0.1).min(60.0);
        self.feedback_interval = Duration::from_secs_f64(1.0 / self.config.max_frame_rate as f64);
    }
    
    /// Get max frame rate
    pub fn get_max_frame_rate(&self) -> f32 {
        self.config.max_frame_rate
    }
}

/// Base64 encoding/decoding utilities
mod base64 {
    const TABLE: &[u8; 64] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    pub fn encode(data: &[u8]) -> String {
        let mut result = String::new();
        let chunks = data.chunks(3);
        
        for chunk in chunks {
            let b0 = chunk[0];
            let b1 = if chunk.len() > 1 { chunk[1] } else { 0 };
            let b2 = if chunk.len() > 2 { chunk[2] } else { 0 };
            
            let index0 = b0 >> 2;
            let index1 = ((b0 & 0x03) << 4) | (b1 >> 4);
            let index2 = ((b1 & 0x0F) << 2) | (b2 >> 6);
            let index3 = b2 & 0x3F;
            
            result.push(TABLE[index0 as usize] as char);
            result.push(TABLE[index1 as usize] as char);
            
            if chunk.len() > 1 {
                result.push(TABLE[index2 as usize] as char);
            } else {
                result.push('=');
            }
            
            if chunk.len() > 2 {
                result.push(TABLE[index3 as usize] as char);
            } else {
                result.push('=');
            }
        }
        
        result
    }
    
    #[allow(dead_code)]
    pub fn decode(encoded: &str) -> Result<Vec<u8>, String> {
        let mut result = Vec::new();
        let chars: Vec<u8> = encoded.chars().filter_map(|c| {
            TABLE.iter().position(|&b| b as char == c).map(|i| i as u8)
        }).collect();
        
        for chunk in chars.chunks(4) {
            if chunk.len() < 2 {
                return Err("Invalid base64".to_string());
            }
            
            let b0 = chunk[0];
            let b1 = chunk[1];
            let b2 = if chunk.len() > 2 { chunk[2] } else { 0 };
            let b3 = if chunk.len() > 3 { chunk[3] } else { 0 };
            
            result.push((b0 << 2) | (b1 >> 4));
            
            if chunk.len() > 2 {
                result.push(((b1 & 0x0F) << 4) | (b2 >> 2));
            }
            
            if chunk.len() > 3 {
                result.push(((b2 & 0x03) << 6) | b3);
            }
        }
        
        Ok(result)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_base64_encode() {
        let data = b"Hello, World!";
        let encoded = base64::encode(data);
        assert_eq!(encoded, "SGVsbG8sIFdvcmxkIQ==");
    }
    
    #[test]
    fn test_base64_decode() {
        let encoded = "SGVsbG8sIFdvcmxkIQ==";
        let decoded = base64::decode(encoded).unwrap();
        assert_eq!(decoded, b"Hello, World!");
    }
    
    #[test]
    fn test_base64_roundtrip() {
        let original = b"Test data with various bytes: \x00\xFF\xAB\xCD";
        let encoded = base64::encode(original);
        let decoded = base64::decode(&encoded).unwrap();
        assert_eq!(original, decoded.as_slice());
    }
    
    #[test]
    fn test_rle_encoding() {
        let data = vec![1u8, 1, 1, 2, 2, 3, 3, 3, 3];
        let encoder = VisualFeedbackEncoder {
            device: unimplemented!(),
            queue: unimplemented!(),
            client: unimplemented!(),
            config: VisualFeedbackConfig::default(),
            feedback_texture: None,
            feedback_view: None,
            last_feedback: Instant::now(),
            feedback_interval: Duration::from_millis(100),
            feedback_count: 0,
            last_metrics: None,
        };
        
        let encoded = encoder.encode_data(&data).unwrap();
        assert!(encoded.len() < data.len()); // Should be compressed
    }
}
