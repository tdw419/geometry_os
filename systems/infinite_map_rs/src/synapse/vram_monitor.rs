/// VRAM Monitor - GPU Memory Orchestration for LLM/Rendering Coexistence
/// 
/// Implements APEX-inspired memory management to prevent OOM errors when
/// running LLM inference alongside high-resolution rendering.

use std::sync::Arc;
use tokio::sync::RwLock;

/// VRAM usage statistics
#[derive(Debug, Clone)]
pub struct VramStats {
    /// Total VRAM available (bytes)
    pub total: u64,
    
    /// Used by rendering pipeline (bytes)
    pub rendering_used: u64,
    
    /// Estimated LLM KV cache size (bytes)
    pub llm_cache_used: u64,
    
    /// Free VRAM (bytes)
    pub free: u64,
    
    /// Utilization percentage (0.0-1.0)
    pub utilization: f32,
}

/// VRAM pressure levels
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum VramPressure {
    /// < 60% utilization - safe for full LLM inference
    Low,
    
    /// 60-80% utilization - consider reducing batch size
    Moderate,
    
    /// 80-90% utilization - fallback to CPU attention
    High,
    
    /// > 90% utilization - emergency: pause LLM inference
    Critical,
}

impl VramPressure {
    pub fn from_utilization(utilization: f32) -> Self {
        match utilization {
            u if u < 0.60 => VramPressure::Low,
            u if u < 0.80 => VramPressure::Moderate,
            u if u < 0.90 => VramPressure::High,
            _ => VramPressure::Critical,
        }
    }
}

/// VRAM Monitor for adaptive memory management
pub struct VramMonitor {
    /// Current VRAM statistics
    stats: Arc<RwLock<VramStats>>,
    
    /// WGPU device for querying memory
    device: Arc<wgpu::Device>,
    
    /// LLM inference parameters
    llm_config: LlmMemoryConfig,
}

/// LLM memory configuration for KV cache estimation
#[derive(Debug, Clone)]
pub struct LlmMemoryConfig {
    /// Number of parameters (e.g., 3B, 7B, 13B)
    pub params: u64,
    
    /// Quantization bits (4, 8, 16)
    pub quant_bits: u8,
    
    /// Number of layers
    pub layers: u32,
    
    /// Number of attention heads
    pub heads: u32,
    
    /// Head dimension
    pub head_dim: u32,
    
    /// Maximum sequence length
    pub max_seq_len: u32,
}

impl LlmMemoryConfig {
    /// Estimate KV cache size in bytes
    /// Formula: 2 * layers * heads * head_dim * seq_len * bytes_per_element
    pub fn estimate_kv_cache(&self, current_seq_len: u32) -> u64 {
        let bytes_per_element = (self.quant_bits / 8) as u64;
        let kv_size = 2 * // K and V
                      self.layers as u64 *
                      self.heads as u64 *
                      self.head_dim as u64 *
                      current_seq_len as u64 *
                      bytes_per_element;
        kv_size
    }
    
    /// Estimate model weight size in bytes
    pub fn estimate_weights(&self) -> u64 {
        let bytes_per_param = (self.quant_bits / 8) as u64;
        self.params * bytes_per_param
    }
}

impl VramMonitor {
    /// Create a new VRAM monitor
    pub fn new(device: Arc<wgpu::Device>, llm_config: LlmMemoryConfig) -> Self {
        let stats = Arc::new(RwLock::new(VramStats {
            total: 0,
            rendering_used: 0,
            llm_cache_used: 0,
            free: 0,
            utilization: 0.0,
        }));
        
        Self {
            stats,
            device,
            llm_config,
        }
    }
    
    /// Update VRAM statistics
    pub async fn update(&self, current_seq_len: u32) {
        // Query WGPU for memory info (note: wgpu doesn't expose this directly yet)
        // This is a placeholder for future wgpu memory query API
        let total_vram = self.estimate_total_vram();
        
        // Estimate rendering usage from texture/buffer allocations
        let rendering_used = self.estimate_rendering_usage();
        
        // Calculate LLM KV cache size
        let llm_cache_used = self.llm_config.estimate_kv_cache(current_seq_len);
        
        let used = rendering_used + llm_cache_used;
        let free = total_vram.saturating_sub(used);
        let utilization = used as f32 / total_vram as f32;
        
        let mut stats = self.stats.write().await;
        stats.total = total_vram;
        stats.rendering_used = rendering_used;
        stats.llm_cache_used = llm_cache_used;
        stats.free = free;
        stats.utilization = utilization;
        
        log::debug!("VRAM: {:.1}% used ({} MB / {} MB)", 
                   utilization * 100.0,
                   used / 1_000_000,
                   total_vram / 1_000_000);
    }
    
    /// Get current VRAM pressure level
    pub async fn get_pressure(&self) -> VramPressure {
        let stats = self.stats.read().await;
        VramPressure::from_utilization(stats.utilization)
    }
    
    /// Get current statistics
    pub async fn get_stats(&self) -> VramStats {
        self.stats.read().await.clone()
    }
    
    /// Check if LLM inference is safe to proceed
    pub async fn can_run_llm(&self) -> bool {
        let pressure = self.get_pressure().await;
        !matches!(pressure, VramPressure::Critical)
    }
    
    /// Recommend LLM batch size based on available VRAM
    pub async fn recommend_batch_size(&self) -> u32 {
        let pressure = self.get_pressure().await;
        match pressure {
            VramPressure::Low => 8,
            VramPressure::Moderate => 4,
            VramPressure::High => 1,
            VramPressure::Critical => 0, // Pause inference
        }
    }
    
    // Private helper methods
    
    fn estimate_total_vram(&self) -> u64 {
        // Placeholder: Query from wgpu::Adapter limits
        // For now, assume 8GB (common for consumer GPUs)
        8 * 1024 * 1024 * 1024
    }
    
    fn estimate_rendering_usage(&self) -> u64 {
        // Placeholder: Track texture/buffer allocations
        // This would integrate with MemoryTextureManager stats
        512 * 1024 * 1024 // Assume 512MB for rendering
    }
}

/// APEX-inspired CPU fallback strategy
pub struct ApexFallback {
    /// Whether CPU attention is enabled
    cpu_attention_enabled: bool,
    
    /// Threshold for triggering CPU fallback (0.0-1.0)
    fallback_threshold: f32,
}

impl ApexFallback {
    pub fn new(fallback_threshold: f32) -> Self {
        Self {
            cpu_attention_enabled: false,
            fallback_threshold,
        }
    }
    
    /// Decide whether to use CPU attention based on VRAM pressure
    pub fn should_use_cpu_attention(&mut self, vram_utilization: f32) -> bool {
        if vram_utilization > self.fallback_threshold {
            self.cpu_attention_enabled = true;
            log::warn!("🔄 APEX Fallback: Switching to CPU attention (VRAM: {:.1}%)", 
                      vram_utilization * 100.0);
        } else if vram_utilization < self.fallback_threshold - 0.1 {
            // Hysteresis: only switch back if utilization drops significantly
            if self.cpu_attention_enabled {
                log::info!("✅ APEX Recovery: Switching back to GPU attention");
            }
            self.cpu_attention_enabled = false;
        }
        
        self.cpu_attention_enabled
    }
}
