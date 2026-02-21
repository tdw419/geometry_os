/// Aesthetic Entropy Monitor - Visual Complexity Analysis
/// 
/// Implements Shannon entropy-based visual quality assessment to trigger
/// LLM-driven shader realignment when aesthetic degradation is detected.

use std::collections::HashMap;

/// Visual entropy analyzer
pub struct EntropyAnalyzer {
    /// Entropy history for trend analysis
    history: Vec<f32>,
    
    /// Maximum history size
    max_history: usize,
    
    /// Entropy threshold for triggering realignment
    realignment_threshold: f32,
    
    /// Minimum frames before re-triggering realignment
    cooldown_frames: u32,
    
    /// Current cooldown counter
    cooldown_counter: u32,
}

impl EntropyAnalyzer {
    /// Create a new entropy analyzer
    pub fn new(realignment_threshold: f32) -> Self {
        Self {
            history: Vec::new(),
            max_history: 60, // 1 second at 60 FPS
            realignment_threshold,
            cooldown_frames: 180, // 3 seconds cooldown
            cooldown_counter: 0,
        }
    }
    
    /// Calculate Shannon entropy of a frame buffer
    /// 
    /// H(X) = -Σ p(xi) * log2(p(xi))
    /// 
    /// Uses pixel histogram to estimate probability distribution
    pub fn calculate_frame_entropy(&self, frame_data: &[u8]) -> f32 {
        if frame_data.is_empty() {
            return 0.0;
        }
        
        // Build histogram of pixel values (simplified: use luminance)
        let mut histogram: HashMap<u8, u32> = HashMap::new();
        
        // Sample every 4th byte (RGBA -> R channel only for speed)
        for chunk in frame_data.chunks(4) {
            if let Some(&r) = chunk.first() {
                *histogram.entry(r).or_insert(0) += 1;
            }
        }
        
        let total_samples = histogram.values().sum::<u32>() as f32;
        
        // Calculate Shannon entropy
        let mut entropy = 0.0;
        for &count in histogram.values() {
            if count > 0 {
                let p = count as f32 / total_samples;
                entropy -= p * p.log2();
            }
        }
        
        entropy
    }
    
    /// Estimate entropy from compressed size (Source Coding Theorem)
    /// 
    /// A signal cannot be compressed to less than its entropy.
    /// We use PNG compression ratio as a proxy for visual entropy.
    pub fn estimate_entropy_from_compression(&self, original_size: usize, compressed_size: usize) -> f32 {
        if original_size == 0 {
            return 0.0;
        }
        
        let compression_ratio = compressed_size as f32 / original_size as f32;
        
        // Entropy estimate: higher compression ratio = lower entropy
        // Normalized to 0-8 bits per byte range
        let entropy = compression_ratio * 8.0;
        
        entropy
    }
    
    /// Update entropy history and check for realignment trigger
    pub fn update(&mut self, entropy: f32) -> bool {
        // Add to history
        self.history.push(entropy);
        if self.history.len() > self.max_history {
            self.history.remove(0);
        }
        
        // Update cooldown
        if self.cooldown_counter > 0 {
            self.cooldown_counter -= 1;
            return false;
        }
        
        // Check if entropy exceeds threshold
        if entropy > self.realignment_threshold {
            log::warn!("🎨 Aesthetic Degradation Detected: Entropy={:.2} (threshold={:.2})", 
                      entropy, self.realignment_threshold);
            
            // Trigger realignment
            self.cooldown_counter = self.cooldown_frames;
            return true;
        }
        
        false
    }
    
    /// Get current entropy
    pub fn current_entropy(&self) -> f32 {
        self.history.last().copied().unwrap_or(0.0)
    }
    
    /// Get entropy trend (positive = increasing chaos)
    pub fn entropy_trend(&self) -> f32 {
        if self.history.len() < 2 {
            return 0.0;
        }
        
        let recent = self.history.last().unwrap();
        let past = self.history.first().unwrap();
        
        recent - past
    }
    
    /// Get average entropy over history window
    pub fn average_entropy(&self) -> f32 {
        if self.history.is_empty() {
            return 0.0;
        }
        
        self.history.iter().sum::<f32>() / self.history.len() as f32
    }
}

/// Aesthetic realignment parameters
#[derive(Debug, Clone)]
pub struct AestheticParams {
    /// Chaos factor (0.0-1.0)
    pub chaos: f32,
    
    /// Color temperature (-1.0 to 1.0, cold to warm)
    pub temperature: f32,
    
    /// Saturation multiplier (0.0-2.0)
    pub saturation: f32,
    
    /// Contrast adjustment (0.0-2.0)
    pub contrast: f32,
    
    /// Smoothness factor (0.0-1.0)
    pub smoothness: f32,
}

impl AestheticParams {
    /// Create default "crystalline" aesthetic
    pub fn crystalline() -> Self {
        Self {
            chaos: 0.2,
            temperature: 0.1,
            saturation: 1.2,
            contrast: 1.3,
            smoothness: 0.8,
        }
    }
    
    /// Create "organic" aesthetic for high-entropy states
    pub fn organic() -> Self {
        Self {
            chaos: 0.6,
            temperature: 0.3,
            saturation: 0.9,
            contrast: 0.9,
            smoothness: 0.4,
        }
    }
    
    /// Interpolate between two aesthetic states
    pub fn lerp(&self, other: &Self, t: f32) -> Self {
        let t = t.clamp(0.0, 1.0);
        Self {
            chaos: self.chaos + (other.chaos - self.chaos) * t,
            temperature: self.temperature + (other.temperature - self.temperature) * t,
            saturation: self.saturation + (other.saturation - self.saturation) * t,
            contrast: self.contrast + (other.contrast - self.contrast) * t,
            smoothness: self.smoothness + (other.smoothness - self.smoothness) * t,
        }
    }
    
    /// Generate LLM prompt for aesthetic realignment
    pub fn to_llm_prompt(&self, current_entropy: f32, target_entropy: f32) -> String {
        format!(
            "The visual substrate has entropy {:.2} (target: {:.2}). \
             Adjust shader parameters to restore crystalline clarity. \
             Current aesthetic: chaos={:.2}, temp={:.2}, sat={:.2}. \
             Recommend new parameters.",
            current_entropy,
            target_entropy,
            self.chaos,
            self.temperature,
            self.saturation
        )
    }
}

/// Aesthetic realignment controller
pub struct AestheticController {
    /// Current aesthetic parameters
    current: AestheticParams,
    
    /// Target aesthetic parameters
    target: AestheticParams,
    
    /// Interpolation progress (0.0-1.0)
    lerp_progress: f32,
    
    /// Interpolation speed (per frame)
    lerp_speed: f32,
}

impl AestheticController {
    pub fn new() -> Self {
        let crystalline = AestheticParams::crystalline();
        Self {
            current: crystalline.clone(),
            target: crystalline,
            lerp_progress: 1.0,
            lerp_speed: 0.02, // 50 frames to complete transition
        }
    }
    
    /// Set new target aesthetic
    pub fn set_target(&mut self, target: AestheticParams) {
        self.target = target;
        self.lerp_progress = 0.0;
    }
    
    /// Update interpolation
    pub fn update(&mut self) {
        if self.lerp_progress < 1.0 {
            self.lerp_progress = (self.lerp_progress + self.lerp_speed).min(1.0);
            self.current = self.current.lerp(&self.target, self.lerp_progress);
        }
    }
    
    /// Get current aesthetic parameters
    pub fn get_current(&self) -> &AestheticParams {
        &self.current
    }
    
    /// Check if transition is complete
    pub fn is_stable(&self) -> bool {
        self.lerp_progress >= 1.0
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_entropy_calculation() {
        let analyzer = EntropyAnalyzer::new(0.8);
        
        // Uniform distribution (low entropy)
        let uniform_data = vec![128u8; 1024];
        let entropy = analyzer.calculate_frame_entropy(&uniform_data);
        assert!(entropy < 1.0, "Uniform data should have low entropy");
        
        // Random distribution (high entropy)
        let random_data: Vec<u8> = (0..1024).map(|i| (i % 256) as u8).collect();
        let entropy = analyzer.calculate_frame_entropy(&random_data);
        assert!(entropy > 4.0, "Random data should have high entropy");
    }
    
    #[test]
    fn test_aesthetic_interpolation() {
        let crystalline = AestheticParams::crystalline();
        let organic = AestheticParams::organic();
        
        let mid = crystalline.lerp(&organic, 0.5);
        
        assert!((mid.chaos - 0.4).abs() < 0.01);
        assert!((mid.temperature - 0.2).abs() < 0.01);
    }
}
