use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// A Synapse represents a connection between a high-dimensional thought vector
/// and a low-dimensional execution pointer (Action).
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Synapse {
    pub id: String,
    pub source_vector: Vec<f32>,      // 1024-dim embedding
    pub target_window_id: Option<String>,
    pub action_target: String,        // e.g. "sys_reboot", "launch:app_id"
    pub activation_threshold: f32,    // 0.0 to 1.0
    pub last_fired: u64,
}

impl Synapse {
    pub fn new(id: String, vector: Vec<f32>, action: String) -> Self {
        Self {
            id,
            source_vector: vector,
            target_window_id: None,
            action_target: action,
            activation_threshold: 0.85, // Default high threshold
            last_fired: 0,
        }
    }
}

/// The Synaptic Layer manages all active synapses and handles resonance checks.
pub struct SynapticLayer {
    pub synapses: HashMap<String, Synapse>,
    // (SynapseID, ActionTarget, Score, Timestamp)
    pub active_resonances: Vec<(String, String, f32, u64)>,
}

impl SynapticLayer {
    pub fn new() -> Self {
        Self {
            synapses: HashMap::new(),
            active_resonances: Vec::new(),
        }
    }

    pub fn register_synapse(&mut self, synapse: Synapse) {
        self.synapses.insert(synapse.id.clone(), synapse);
    }

    /// Calculate resonance (Cosine Similarity) between input vector and all synapses.
    /// Returns a list of (Synapse, ResonanceScore) that exceeded threshold.
    pub fn check_resonance(&mut self, input_vector: &[f32]) -> Vec<(&Synapse, f32)> {
        let mut activated = Vec::new();

        for synapse in self.synapses.values() {
            let score = cosine_similarity(input_vector, &synapse.source_vector);
            if score >= synapse.activation_threshold {
                activated.push((synapse, score));
            }
        }
        
        // Sort by resonance strength
        activated.sort_by(|a, b| b.1.partial_cmp(&a.1).unwrap_or(std::cmp::Ordering::Equal));
        
        // Record activations for visualization
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;
            
        for (synapse, score) in &activated {
            self.active_resonances.push((
                synapse.id.clone(), 
                synapse.action_target.clone(), 
                *score, 
                now
            ));
        }
        
        activated
    }
    
    pub fn prune_resonances(&mut self, max_age_ms: u64) {
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;
            
        self.active_resonances.retain(|(_, _, _, timestamp)| {
            now - timestamp < max_age_ms
        });
    }

    /// Direct signal of intent (bypasses resonance check)
    pub fn signal_intent(&mut self, id: String, action: String, score: f32) {
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;
        self.active_resonances.push((id, action, score, now));
    }
}

fn cosine_similarity(a: &[f32], b: &[f32]) -> f32 {
    if a.len() != b.len() {
        return 0.0;
    }

    let mut dot_product = 0.0;
    let mut norm_a = 0.0;
    let mut norm_b = 0.0;

    for i in 0..a.len() {
        dot_product += a[i] * b[i];
        norm_a += a[i] * a[i];
        norm_b += b[i] * b[i];
    }

    if norm_a == 0.0 || norm_b == 0.0 {
        return 0.0;
    }

    dot_product / (norm_a.sqrt() * norm_b.sqrt())
}
