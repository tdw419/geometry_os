//! Neural State Manager
//! Manages neural activations, audio features, and input state
//! Exposes unified state to shaders for geometric synthesis

use std::f32;
use crate::evolution_protocol::{NeuralStateData, AudioFeatures, InputState, SelfState, TheoryOfMindState, CognitiveState};

/// Unified neural state for shader rendering
#[derive(Debug, Clone)]
#[allow(dead_code)]
pub struct NeuralState {
    // Layer activations (from Phase 19)
    pub layer_activations: Vec<f32>,
    
    // Audio features (from Phase 21)
    pub audio_features: AudioFeatures,
    
    // Input state (from Phase 21)
    pub input_state: InputState,
    
    // Consciousness (from Phase 23)
    pub self_state: SelfState,
    
    // Theory of Mind (from Phase 24)
    // Theory of Mind (from Phase 24)
    pub theory_of_mind: TheoryOfMindState,
    
    // Cognitive State (from Phase 27)
    pub cognitive_state: CognitiveState,
    
    // Derived metrics
    pub arousal: f32,
    pub valence: f32,
    pub entropy: f32,
    
    // Time for shader animation
    pub time: f32,
}

#[allow(dead_code)]
impl NeuralState {
    /// Create a new neural state with default values
    pub fn new() -> Self {
        Self {
            layer_activations: vec![0.0; 8],
            audio_features: AudioFeatures::default(),
            input_state: InputState::default(),
            self_state: SelfState::default(),
            theory_of_mind: TheoryOfMindState::default(),
            cognitive_state: CognitiveState::default(),
            arousal: 0.0,
            valence: 0.0,
            entropy: 0.5,
            time: 0.0,
        }
    }
    
    /// Update neural state from protocol message
    pub fn update_from_protocol(&mut self, msg: &NeuralStateData) {
        self.layer_activations = msg.layer_activations.clone();
        self.self_state.confidence = msg.confidence;
        
        // Calculate derived metrics
        self.update_derived_metrics();
    }
    
    /// Update audio features from protocol message
    pub fn update_audio_features(&mut self, features: AudioFeatures) {
        self.audio_features = features;
        self.update_derived_metrics();
    }
    
    /// Update input state from protocol message
    pub fn update_input_state(&mut self, state: InputState) {
        self.input_state = state;
        self.update_derived_metrics();
    }
    
    /// Update self state from protocol message
    pub fn update_self_state(&mut self, state: SelfState) {
        self.self_state = state;
        // Self-confidence might act as a damper for visual noise (future)
        self.update_derived_metrics();
    }
    
    /// Update theory of mind state from protocol message
    pub fn update_theory_of_mind(&mut self, state: TheoryOfMindState) {
        self.theory_of_mind = state;
        // Theory of mind influences system behavior based on user intent
        self.update_derived_metrics();
    }
    
    /// Update cognitive state from protocol message (Phase 27)
    pub fn update_cognitive_state(&mut self, state: CognitiveState) {
        self.cognitive_state = state;
        // Cognitive load increases entropy (heat)
        self.update_derived_metrics();
    }
    
    /// Update time (called each frame)
    pub fn update_time(&mut self, delta: f32) {
        self.time += delta;
    }
    
    /// Calculate derived metrics from current state
    fn update_derived_metrics(&mut self) {
        // Arousal: average of layer activations
        self.arousal = self.layer_activations.iter().sum::<f32>() / 8.0;
        
        // Valence: difference between positive and negative activations
        let positive_sum: f32 = self.layer_activations[0..4].iter().sum();
        let negative_sum: f32 = self.layer_activations[4..8].iter().sum();
        self.valence = positive_sum - negative_sum;
        
        // Entropy: influenced by audio and input
        // Higher bass energy = lower entropy (more rhythmic)
        // Higher input velocity = higher entropy (more chaotic)
        let audio_entropy = 1.0 - self.audio_features.bass_energy;
        let input_entropy = self.input_state.velocity / 20.0; // Normalize to 0-1
        self.entropy = (audio_entropy + input_entropy) / 2.0;
    }
    
    /// Get shader uniforms for neural state
    pub fn get_shader_uniforms(&self) -> ShaderUniforms {
        ShaderUniforms {
            // Layer activations (8 values)
            layer_0: self.layer_activations[0],
            layer_1: self.layer_activations[1],
            layer_2: self.layer_activations[2],
            layer_3: self.layer_activations[3],
            layer_4: self.layer_activations[4],
            layer_5: self.layer_activations[5],
            layer_6: self.layer_activations[6],
            layer_7: self.layer_activations[7],
            
            // Audio features
            bass_energy: self.audio_features.bass_energy,
            treble_energy: self.audio_features.treble_energy,
            volume: self.audio_features.volume,
            is_beat: if self.audio_features.is_beat { 1.0 } else { 0.0 },
            startle: if self.audio_features.startle { 1.0 } else { 0.0 },
            
            // Input state
            velocity: self.input_state.velocity,
            is_focused: if self.input_state.is_focused { 1.0 } else { 0.0 },
            is_idle: if self.input_state.is_idle { 1.0 } else { 0.0 },
            chaos: self.input_state.chaos,
            
            // Self state (Phase 23)
            confidence: self.self_state.confidence,
            focus_depth: self.self_state.focus_depth,
            
            // Theory of Mind (Phase 24)
            user_intent_confidence: self.theory_of_mind.user_intent.intent_confidence,
            user_attention_focus: self.theory_of_mind.user_intent.attention_focus,
            user_engagement_level: self.theory_of_mind.user_intent.engagement_level,
            alignment: self.theory_of_mind.alignment,
            mind_reading_confidence: self.theory_of_mind.mind_reading_confidence,

            misalignment_detected: if self.theory_of_mind.misalignment_detected { 1.0 } else { 0.0 },
            
            // Cognitive State (Phase 27)
            cognitive_complexity: self.cognitive_state.complexity,
            cognitive_safety: self.cognitive_state.safety_score,
            is_reasoning: if self.cognitive_state.is_reasoning { 1.0 } else { 0.0 },
            
            // Derived metrics
            arousal: self.arousal,
            valence: self.valence,
            entropy: self.entropy,
            
            // Time
            time: self.time,
        }
    }
}

/// Shader uniforms for neural state visualization
#[derive(Debug, Clone, Copy)]
#[allow(dead_code)]
pub struct ShaderUniforms {
    // Layer activations
    pub layer_0: f32,
    pub layer_1: f32,
    pub layer_2: f32,
    pub layer_3: f32,
    pub layer_4: f32,
    pub layer_5: f32,
    pub layer_6: f32,
    pub layer_7: f32,
    
    // Audio features
    pub bass_energy: f32,
    pub treble_energy: f32,
    pub volume: f32,
    pub is_beat: f32,
    pub startle: f32,
    
    // Input state
    pub velocity: f32,
    pub is_focused: f32,
    pub is_idle: f32,
    pub chaos: f32,
    
    // Self state
    pub confidence: f32,
    pub focus_depth: f32,
    
    // Theory of Mind (Phase 24)
    pub user_intent_confidence: f32,
    pub user_attention_focus: f32,
    pub user_engagement_level: f32,
    pub alignment: f32,
    pub mind_reading_confidence: f32,

    pub misalignment_detected: f32,
    
    // Cognitive State (Phase 27)
    pub cognitive_complexity: f32,
    pub cognitive_safety: f32,
    pub is_reasoning: f32,
    
    // Derived metrics
    pub arousal: f32,
    pub valence: f32,
    pub entropy: f32,
    
    // Time
    pub time: f32,
}



#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_neural_state_creation() {
        let state = NeuralState::new();
        assert_eq!(state.layer_activations.len(), 8);
        assert_eq!(state.arousal, 0.0);
        assert_eq!(state.valence, 0.0);
    }
    
    #[test]
    fn test_derived_metrics() {
        let mut state = NeuralState::new();
        state.layer_activations = vec![1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0];
        state.update_derived_metrics();
        
        // Arousal should be 0.5
        assert!((state.arousal - 0.5).abs() < 0.01);
        
        // Valence should be 1.0 (positive - negative)
        assert!((state.valence - 1.0).abs() < 0.01);
    }
    
    #[test]
    fn test_shader_uniforms() {
        let state = NeuralState::new();
        let uniforms = state.get_shader_uniforms();
        
        assert_eq!(uniforms.layer_0, 0.0);
        assert_eq!(uniforms.bass_energy, 0.0);
        assert_eq!(uniforms.velocity, 0.0);
        assert_eq!(uniforms.time, 0.0);
    }
}
