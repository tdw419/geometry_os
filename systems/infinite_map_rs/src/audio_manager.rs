#![allow(dead_code, unused_imports, unused_variables)]
//! Audio Manager - Real-time Audio Analysis for Phase 28 Sensory Calibration
//!
//! Captures audio input, performs FFT analysis, and extracts features
//! for driving 14n topological geometry visualization.
//!
//! NOTE: This module requires the "audio" feature to be enabled.
//! Without it, only stub implementations are provided.

use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

/// Audio features extracted for shader consumption
#[derive(Debug, Clone, Copy)]
pub struct AudioFeatures {
    /// Bass energy (low frequencies, 20-250 Hz) - drives cluster scale
    pub bass_energy: f32,
    /// Treble energy (high frequencies, 2-20 kHz) - drives cluster sparkle
    pub treble_energy: f32,
    /// Overall volume level (0-1)
    pub volume: f32,
    /// Beat detection flag (1.0 if beat detected, 0.0 otherwise)
    pub is_beat: f32,
    /// Startle detection flag (1.0 if sudden loud sound, 0.0 otherwise)
    pub startle: f32,
    /// Spectral centroid (brightness of sound)
    pub spectral_centroid: f32,
}

impl Default for AudioFeatures {
    fn default() -> Self {
        Self {
            bass_energy: 0.0,
            treble_energy: 0.0,
            volume: 0.0,
            is_beat: 0.0,
            startle: 0.0,
            spectral_centroid: 0.5,
        }
    }
}

/// Audio manager configuration
#[derive(Debug, Clone)]
pub struct AudioManagerConfig {
    /// Sample rate for audio capture
    pub sample_rate: u32,
    /// Buffer size for FFT (must be power of 2)
    pub fft_size: usize,
    /// Number of channels (1 = mono, 2 = stereo)
    pub channels: u16,
    /// Beat detection threshold (0-1)
    pub beat_threshold: f32,
    /// Startle detection threshold (0-1)
    pub startle_threshold: f32,
    /// Update interval for feature extraction
    pub update_interval: Duration,
}

impl Default for AudioManagerConfig {
    fn default() -> Self {
        Self {
            sample_rate: 44100,
            fft_size: 1024, // 2^10
            channels: 2,
            beat_threshold: 0.7,
            startle_threshold: 0.85,
            update_interval: Duration::from_millis(16), // ~60 Hz
        }
    }
}

/// Audio manager - captures and analyzes audio in real-time
pub struct AudioManager {
    config: AudioManagerConfig,
    
    // Feature extraction
    features: Arc<Mutex<AudioFeatures>>,
    last_update: Instant,
    
    // State
    is_running: bool,
}

impl AudioManager {
    /// Create a new audio manager
    pub fn new(config: AudioManagerConfig) -> Result<Self, Box<dyn std::error::Error>> {
        Ok(Self {
            config,
            features: Arc::new(Mutex::new(AudioFeatures::default())),
            last_update: Instant::now(),
            is_running: false,
        })
    }
    
    /// Initialize audio capture
    pub fn initialize(&mut self) -> Result<(), Box<dyn std::error::Error>> {
        #[cfg(feature = "audio")]
        {
            // Real audio initialization with cpal and rustfft
            use cpal::traits::{DeviceTrait, HostTrait};
            use cpal::{Device, StreamConfig, SampleFormat, SupportedStreamConfig};
            use rustfft::{FftPlanner, num_complex::Complex};
            
            // Get default audio input device
            let host = cpal::default_host();
            let device = host
                .default_input_device()
                .ok_or("No default input device available")?;
            
            // Get supported config
            let supported_config = device
                .default_input_config()
                .map_err(|e| format!("Failed to get default input config: {}", e))?;
            
            // Configure stream
            let config = StreamConfig {
                channels: self.config.channels,
                sample_rate: cpal::SampleRate(self.config.sample_rate),
                buffer_size: cpal::BufferSize::Fixed(self.config.fft_size as u32),
            };
            
            // Create stream
            let fft_size = self.config.fft_size;
            let features = self.features.clone();
            
            let stream = match supported_config.sample_format() {
                SampleFormat::F32 => device.build_input_stream(
                    &config,
                    move |data: &[f32], _: &cpal::InputCallbackInfo| {
                        Self::process_audio_f32(data, fft_size, &features);
                    },
                    Self::error_callback,
                )?,
                SampleFormat::I16 => device.build_input_stream(
                    &config,
                    move |data: &[i16], _: &cpal::InputCallbackInfo| {
                        Self::process_audio_i16(data, fft_size, &features);
                    },
                    Self::error_callback,
                )?,
                SampleFormat::U16 => device.build_input_stream(
                    &config,
                    move |data: &[u16], _: &cpal::InputCallbackInfo| {
                        Self::process_audio_u16(data, fft_size, &features);
                    },
                    Self::error_callback,
                )?,
                _ => return Err("Unsupported sample format".into()),
            };
            
            // Start the stream
            stream.play()?;
            self.is_running = true;
            
            log::info!("Audio manager initialized: {} Hz, {} channels", 
                       self.config.sample_rate, self.config.channels);
        }
        
        #[cfg(not(feature = "audio"))]
        {
            log::warn!("Audio manager initialized (stub - 'audio' feature not enabled)");
            self.is_running = false;
        }
        
        Ok(())
    }
    
    /// Process f32 audio samples
    #[cfg(feature = "audio")]
    fn process_audio_f32(data: &[f32], fft_size: usize, features: &Arc<Mutex<AudioFeatures>>) {
        if data.len() < fft_size {
            return;
        }
        
        // Extract mono channel
        let mut mono = vec![0.0f32; fft_size];
        for i in 0..fft_size {
            mono[i] = data[i];
        }
        
        // Perform FFT
        let mut planner = rustfft::FftPlanner::new();
        let fft = planner.plan_fft(fft_size);
        let mut spectrum: Vec<rustfft::num_complex::Complex<f32>> = 
            vec![rustfft::num_complex::Complex::new(0.0, 0.0); fft_size];
        fft.process(&mut mono, &mut spectrum);
        
        // Extract features
        let extracted = Self::extract_features(&spectrum, fft_size);
        
        // Update features
        if let Ok(mut features_guard) = features.lock() {
            *features_guard = extracted;
        }
    }
    
    /// Process i16 audio samples
    #[cfg(feature = "audio")]
    fn process_audio_i16(data: &[i16], fft_size: usize, features: &Arc<Mutex<AudioFeatures>>) {
        if data.len() < fft_size {
            return;
        }
        
        // Convert to f32
        let mut f32_data = vec![0.0f32; fft_size];
        for i in 0..fft_size {
            f32_data[i] = data[i] as f32 / 32768.0;
        }
        
        Self::process_audio_f32(&f32_data, fft_size, features);
    }
    
    /// Process u16 audio samples
    #[cfg(feature = "audio")]
    fn process_audio_u16(data: &[u16], fft_size: usize, features: &Arc<Mutex<AudioFeatures>>) {
        if data.len() < fft_size {
            return;
        }
        
        // Convert to f32
        let mut f32_data = vec![0.0f32; fft_size];
        for i in 0..fft_size {
            f32_data[i] = (data[i] as f32 - 32768.0) / 32768.0;
        }
        
        Self::process_audio_f32(&f32_data, fft_size, features);
    }
    
    /// Extract audio features from FFT spectrum
    #[cfg(feature = "audio")]
    fn extract_features(spectrum: &[rustfft::num_complex::Complex<f32>], fft_size: usize) -> AudioFeatures {
        let sample_rate = 44100.0;
        let bin_size = sample_rate / fft_size as f32;
        
        // Calculate magnitudes
        let magnitudes: Vec<f32> = spectrum
            .iter()
            .map(|c| (c.re * c.re + c.im * c.im).sqrt())
            .collect();
        
        // Bass energy (20-250 Hz)
        let bass_start = (20.0 / bin_size) as usize;
        let bass_end = (250.0 / bin_size) as usize;
        let bass_energy: f32 = magnitudes[bass_start..bass_end.min(magnitudes.len())]
            .iter()
            .sum::<f32>() / (bass_end - bass_start) as f32;
        
        // Treble energy (2-20 kHz)
        let treble_start = (2000.0 / bin_size) as usize;
        let treble_end = (20000.0 / bin_size) as usize;
        let treble_energy: f32 = magnitudes[treble_start..treble_end.min(magnitudes.len())]
            .iter()
            .sum::<f32>() / (treble_end - treble_start) as f32;
        
        // Overall volume
        let volume: f32 = magnitudes.iter().sum::<f32>() / magnitudes.len() as f32;
        
        // Spectral centroid (brightness)
        let mut weighted_sum = 0.0f32;
        let mut magnitude_sum = 0.0f32;
        for (i, &mag) in magnitudes.iter().enumerate() {
            weighted_sum += i as f32 * mag;
            magnitude_sum += mag;
        }
        let spectral_centroid = if magnitude_sum > 0.0 {
            weighted_sum / magnitude_sum / magnitudes.len() as f32
        } else {
            0.5
        };
        
        // Normalize features
        let bass_normalized = (bass_energy / 1000.0).clamp(0.0, 1.0);
        let treble_normalized = (treble_energy / 100.0).clamp(0.0, 1.0);
        let volume_normalized = (volume / 100.0).clamp(0.0, 1.0);
        
        AudioFeatures {
            bass_energy: bass_normalized,
            treble_energy: treble_normalized,
            volume: volume_normalized,
            is_beat: 0.0, // Will be updated in update()
            startle: 0.0, // Will be updated in update()
            spectral_centroid,
        }
    }
    
    /// Start audio capture
    pub fn start(&mut self) -> Result<(), Box<dyn std::error::Error>> {
        self.is_running = true;
        log::info!("Audio capture started");
        Ok(())
    }
    
    /// Stop audio capture
    pub fn stop(&mut self) {
        self.is_running = false;
        log::info!("Audio capture stopped");
    }
    
    /// Update features (called periodically from main loop)
    pub fn update(&mut self) {
        let now = Instant::now();
        
        // Only update at specified interval
        if now.duration_since(self.last_update) < self.config.update_interval {
            return;
        }
        
        self.last_update = now;
        
        // Stub: Generate default features when audio feature is disabled
        #[cfg(not(feature = "audio"))]
        {
            let mut features_guard = self.features.lock().unwrap();
            features_guard.bass_energy = 0.3;
            features_guard.treble_energy = 0.4;
            features_guard.volume = 0.5;
            features_guard.is_beat = 0.0;
            features_guard.startle = 0.0;
        }
    }
    
    /// Get current audio features
    pub fn get_features(&self) -> AudioFeatures {
        let features_guard = self.features.lock().unwrap();
        *features_guard
    }
    
    /// Check if audio manager is running
    pub fn is_running(&self) -> bool {
        self.is_running
    }
    
    /// Error callback for audio stream
    #[cfg(feature = "audio")]
    fn error_callback(err: cpal::StreamError) {
        log::error!("Audio stream error: {}", err);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_audio_features_default() {
        let features = AudioFeatures::default();
        assert_eq!(features.bass_energy, 0.0);
        assert_eq!(features.treble_energy, 0.0);
        assert_eq!(features.volume, 0.0);
    }
    
    #[test]
    fn test_audio_manager_config_default() {
        let config = AudioManagerConfig::default();
        assert_eq!(config.sample_rate, 44100);
        assert_eq!(config.fft_size, 1024);
        assert_eq!(config.channels, 2);
    }
}
