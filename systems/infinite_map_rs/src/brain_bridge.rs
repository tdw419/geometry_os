//! Brain Bridge - MMIO Bridge between Glyph Substrate and LM Studio
//!
//! Polls a semaphore in GPU memory and forwards HTTP requests
//! to LM Studio's OpenAI-compatible API.

use std::io::Write;
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::Mutex;
use wgpu::{Device, Queue, Texture};
use wgpu::util::DeviceExt;  // For create_buffer_init
use serde::{Deserialize, Serialize};
use crate::hilbert::d2xy;

/// Memory addresses for brain bridge communication
pub mod addresses {
    pub const CTRL_SEMAPHORE: u32 = 0x2000;
    pub const RESPONSE_READY: u32 = 0x2004;
    pub const REQUEST_LENGTH: u32 = 0x2008;
    pub const HTTP_REQUEST_START: u32 = 0x0500;
    pub const HTTP_RESPONSE_START: u32 = 0x1000;
    pub const HTTP_RESPONSE_MAX: usize = 4096;
}

/// LM Studio API configuration
pub struct BrainBridgeConfig {
    pub lm_studio_url: String,
    pub poll_interval_ms: u64,
}

impl Default for BrainBridgeConfig {
    fn default() -> Self {
        Self {
            lm_studio_url: "http://localhost:1234".to_string(),
            poll_interval_ms: 100,
        }
    }
}

/// Bridge between GPU substrate and LM Studio
pub struct BrainBridge {
    config: BrainBridgeConfig,
    client: reqwest::Client,
    device: Arc<Device>,
    queue: Arc<Queue>,
    ram_texture: Arc<Texture>,
    running: Arc<Mutex<bool>>,
}

/// Request format for LM Studio chat completions
#[derive(Debug, Serialize)]
struct ChatRequest {
    model: String,
    messages: Vec<Message>,
    temperature: f32,
    max_tokens: u32,
}

#[derive(Debug, Serialize, Deserialize)]
struct Message {
    role: String,
    content: String,
}

/// Response format from LM Studio
#[derive(Debug, Deserialize)]
struct ChatResponse {
    choices: Vec<Choice>,
}

#[derive(Debug, Deserialize)]
struct Choice {
    message: Message,
}

impl BrainBridge {
    /// Create a new brain bridge
    pub fn new(
        config: BrainBridgeConfig,
        device: Arc<Device>,
        queue: Arc<Queue>,
        ram_texture: Arc<Texture>,
    ) -> Self {
        Self {
            config,
            client: reqwest::Client::new(),
            device,
            queue,
            ram_texture,
            running: Arc::new(Mutex::new(false)),
        }
    }

    /// Start the brain bridge polling loop
    pub async fn start(&self) {
        let mut running = self.running.lock().await;
        *running = true;
        drop(running);

        println!("🧠 Brain Bridge started - polling for glyph requests");
        std::io::stdout().flush().unwrap();

        loop {
            let running = self.running.lock().await;
            if !*running {
                break;
            }
            drop(running);

            if let Err(e) = self.poll_and_forward().await {
                println!("⚠️  Brain bridge error: {}", e);
                std::io::stdout().flush().unwrap();
            }

            tokio::time::sleep(Duration::from_millis(self.config.poll_interval_ms)).await;
        }
    }

    /// Stop the brain bridge
    pub async fn stop(&self) {
        let mut running = self.running.lock().await;
        *running = false;
        log::info!("🧠 Brain Bridge stopped");
    }

    /// Poll GPU memory for pending request and forward to LM Studio
    async fn poll_and_forward(&self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        // Read semaphore from GPU texture
        let semaphore = self.read_gpu_u32(addresses::CTRL_SEMAPHORE).await?;

        if semaphore != 1 {
            return Ok(()); // No pending request
        }

        println!("🧠 Glyph request detected - reading HTTP buffer");
        std::io::stdout().flush().unwrap();

        // Read request length
        let request_len = self.read_gpu_u32(addresses::REQUEST_LENGTH).await? as usize;

        if request_len == 0 || request_len > 3072 {
            log::warn!("Invalid request length: {}", request_len);
            self.write_gpu_u32(addresses::CTRL_SEMAPHORE, 0).await?;
            return Ok(());
        }

        // Read HTTP request body from GPU memory
        let request_body = self.read_gpu_bytes(addresses::HTTP_REQUEST_START, request_len).await?;

        log::info!("🧠 Forwarding {} bytes to LM Studio", request_len);

        // Forward to LM Studio
        let response = self.forward_to_lm_studio(&request_body).await?;

        // Write response to GPU memory
        let response_bytes = response.as_bytes();
        let response_len = response_bytes.len().min(addresses::HTTP_RESPONSE_MAX);

        self.write_gpu_bytes(addresses::HTTP_RESPONSE_START, &response_bytes[..response_len]).await?;
        self.write_gpu_u32(addresses::RESPONSE_READY, 1).await?;
        self.write_gpu_u32(addresses::CTRL_SEMAPHORE, 0).await?; // Clear request

        println!("🧠 Response written ({} bytes)", response_len);
        std::io::stdout().flush().unwrap();

        Ok(())
    }

    /// Forward request to LM Studio and return response
    async fn forward_to_lm_studio(&self, request_body: &[u8]) -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
        // Parse the request body as JSON (glyph sends chat format)
        let request_text = String::from_utf8_lossy(request_body);

        // If it's raw text, wrap it in a chat request
        let chat_request = if request_text.starts_with('{') {
            // Already JSON - pass through
            request_text.to_string()
        } else {
            // Wrap in chat request format
            let chat = ChatRequest {
                model: "local-model".to_string(),
                messages: vec![
                    Message {
                        role: "system".to_string(),
                        content: "You are the Sisyphus Brain of Geometry OS. Analyze substrate state and return JSON commands.".to_string(),
                    },
                    Message {
                        role: "user".to_string(),
                        content: request_text.to_string(),
                    },
                ],
                temperature: 0.7,
                max_tokens: 500,
            };
            serde_json::to_string(&chat)?
        };

        let response = self.client
            .post(format!("{}/v1/chat/completions", self.config.lm_studio_url))
            .header("Content-Type", "application/json")
            .body(chat_request)
            .send()
            .await?;

        if !response.status().is_success() {
            return Err(format!("LM Studio error: {}", response.status()).into());
        }

        let chat_response: ChatResponse = response.json().await?;

        let content = chat_response
            .choices
            .first()
            .map(|c| c.message.content.clone())
            .unwrap_or_default();

        Ok(content)
    }

    /// Read a u32 from GPU texture at Hilbert address
    /// Each address is a word address (one pixel = one 32-bit value)
    pub async fn read_gpu_u32(&self, addr: u32) -> Result<u32, Box<dyn std::error::Error + Send + Sync>> {
        let (tx, ty) = d2xy(4096, addr as u64);

        let staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("brain_bridge_u32_staging"),
            size: 256, // wgpu requires minimum 256 for buffer-to-texture copy
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("brain_bridge_read_u32"),
        });

        encoder.copy_texture_to_buffer(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                aspect: wgpu::TextureAspect::All,
            },
            wgpu::ImageCopyBuffer {
                buffer: &staging,
                layout: wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(256),
                    rows_per_image: Some(1),
                },
            },
            wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
        );

        self.queue.submit(Some(encoder.finish()));

        let slice = staging.slice(..);
        let (tx_chan, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |res| { tx_chan.send(res).ok(); });
        self.device.poll(wgpu::Maintain::Wait);

        if let Ok(Ok(())) = rx.recv() {
            let data = slice.get_mapped_range();
            // RGBA format: R=byte0, G=byte1, B=byte2, A=byte3
            let value = u32::from_le_bytes([data[0], data[1], data[2], data[3]]);
            drop(data);
            staging.unmap();
            Ok(value)
        } else {
            Err("Failed to read GPU memory".into())
        }
    }

    /// Write a u32 to GPU texture at Hilbert address
    /// Each address is a word address (one pixel = one 32-bit value)
    pub async fn write_gpu_u32(&self, addr: u32, value: u32) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        let (tx, ty) = d2xy(4096, addr as u64);
        let bytes = value.to_le_bytes(); // RGBA: [R, G, B, A]

        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                aspect: wgpu::TextureAspect::All,
            },
            &bytes,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4),
                rows_per_image: Some(1),
            },
            wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
        );

        Ok(())
    }

    /// Read multiple 32-bit words from GPU texture starting at Hilbert address
    /// Returns bytes (4 bytes per word)
    pub async fn read_gpu_bytes(&self, start_addr: u32, len: usize) -> Result<Vec<u8>, Box<dyn std::error::Error + Send + Sync>> {
        // len is in bytes, but we read whole words (4 bytes each)
        let num_words = (len + 3) / 4; // Round up to nearest word
        let mut result = Vec::with_capacity(num_words * 4);

        for i in 0..num_words {
            let addr = start_addr + i as u32;
            let (tx, ty) = d2xy(4096, addr as u64);

            let staging = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("brain_bridge_staging"),
                size: 256,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("brain_bridge_read"),
            });

            encoder.copy_texture_to_buffer(
                wgpu::ImageCopyTexture {
                    texture: &self.ram_texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                wgpu::ImageCopyBuffer {
                    buffer: &staging,
                    layout: wgpu::ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(256),
                        rows_per_image: Some(1),
                    },
                },
                wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
            );

            self.queue.submit(Some(encoder.finish()));

            let slice = staging.slice(..);
            let (tx_chan, rx) = std::sync::mpsc::channel();
            slice.map_async(wgpu::MapMode::Read, move |res| { tx_chan.send(res).ok(); });
            self.device.poll(wgpu::Maintain::Wait);

            if let Ok(Ok(())) = rx.recv() {
                let data = slice.get_mapped_range();
                // Read all 4 bytes (RGBA) of the pixel
                result.extend_from_slice(&data[0..4]);
                drop(data);
                staging.unmap();
            }
        }

        // Truncate to requested length
        result.truncate(len);
        Ok(result)
    }

    /// Write bytes to GPU texture starting at Hilbert address
    /// Bytes are packed into 32-bit words (4 bytes per pixel)
    pub async fn write_gpu_bytes(&self, start_addr: u32, data: &[u8]) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        // Pad data to multiple of 4 bytes
        let padded_len = (data.len() + 3) & !3;
        let mut padded = data.to_vec();
        padded.resize(padded_len, 0);

        // Write each 4-byte chunk as one pixel
        for (i, chunk) in padded.chunks_exact(4).enumerate() {
            let addr = start_addr + i as u32;
            let (tx, ty) = d2xy(4096, addr as u64);

            self.queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture: &self.ram_texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                chunk,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4),
                    rows_per_image: Some(1),
                },
                wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
            );
        }

        Ok(())
    }

    /// Test connection to LM Studio
    pub async fn test_connection(&self) -> Result<bool, Box<dyn std::error::Error + Send + Sync>> {
        let response = self.client
            .get(format!("{}/v1/models", self.config.lm_studio_url))
            .send()
            .await?;

        Ok(response.status().is_success())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::hilbert::d2xy;

    #[test]
    fn test_hilbert_d2xy_consistency() {
        // Verify consistency with crate::hilbert
        assert_eq!(d2xy(4096, 0), (0, 0));
        assert_eq!(d2xy(4096, 1), (1, 0));
        assert_eq!(d2xy(4096, 2), (1, 1));
        assert_eq!(d2xy(4096, 3), (0, 1));
    }

    #[test]
    fn test_addresses() {
        assert_eq!(addresses::CTRL_SEMAPHORE, 0x2000);
        assert_eq!(addresses::HTTP_REQUEST_START, 0x0500);
    }
}
