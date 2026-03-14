use std::time::{Instant, Duration};
use crate::cortex::Neuromodulator;

/// Metabolic State - The biochemical state of the cognitive system
#[derive(Debug, Clone, Copy)]
pub struct MetabolicState {
    /// Current instruction budget (cycles per frame)
    pub instruction_budget: u32,
    /// Base budget before neuromodulation
    pub base_budget: u32,
    /// Neuromodulation values
    pub neuromodulator: Neuromodulator,
}

impl Default for MetabolicState {
    fn default() -> Self {
        Self {
            instruction_budget: 10000,
            base_budget: 10000,
            neuromodulator: Neuromodulator::default(),
        }
    }
}

impl MetabolicState {
    /// Get the effective multiplier based on current neuromodulation
    pub fn get_multiplier(&self) -> f32 {
        if self.base_budget > 0 {
            self.instruction_budget as f32 / self.base_budget as f32
        } else {
            1.0
        }
    }

    /// Get a human-readable state description
    pub fn get_state_name(&self) -> &'static str {
        let mult = self.get_multiplier();
        if self.neuromodulator.urgency > 0.7 {
            "PANIC"
        } else if mult > 2.0 {
            "FLOW"
        } else if mult > 1.2 {
            "FOCUSED"
        } else if mult < 0.8 {
            "THROTTLED"
        } else {
            "BASELINE"
        }
    }
}

#[derive(Debug, Clone, Copy)]
pub struct PasScore {
    pub p: f32, // Performance (0.0 - 1.0)
    pub a: f32, // Aesthetic (0.0 - 1.0)
    pub s: f32, // System (0.0 - 1.0)
}

impl PasScore {
    pub fn calculate(&self) -> f32 {
        (self.p * 0.4) + (self.a * 0.4) + (self.s * 0.2)
    }

    pub fn get_color(&self) -> [f32; 4] {
        let score = self.calculate();
        if score > 0.8 {
            [0.0, 1.0, 0.5, 1.0] // Crystalline Green
        } else if score > 0.5 {
            [1.0, 0.8, 0.0, 1.0] // Amber Caution
        } else {
            [1.0, 0.2, 0.2, 1.0] // Fracture Red
        }
    }
}

pub struct DiagnosticOverlay {
    pub enabled: bool,
    pub expanded: bool,
    pub current_pas: PasScore,
    pub last_update: Instant,
    pub frame_times: Vec<Duration>,
    pub vram_usage_bytes: u64,
    pub vram_limit_bytes: u64,
    /// Phase 47: Metabolic state from RISC-V executor
    pub metabolic_state: MetabolicState,
}

impl DiagnosticOverlay {
    pub fn new() -> Self {
        Self {
            enabled: true,
            expanded: false,
            current_pas: PasScore { p: 1.0, a: 1.0, s: 1.0 },
            last_update: Instant::now(),
            frame_times: Vec::with_capacity(60),
            vram_usage_bytes: 0,
            vram_limit_bytes: 4 * 1024 * 1024 * 1024, // Default 4GB
            metabolic_state: MetabolicState::default(),
        }
    }

    pub fn update_performance(&mut self, frame_time: Duration) {
        self.frame_times.push(frame_time);
        if self.frame_times.len() > 60 {
            self.frame_times.remove(0);
        }

        let avg_frame_time = self.frame_times.iter().sum::<Duration>().as_secs_f32() / self.frame_times.len() as f32;
        let target_frame_time = 1.0 / 60.0;
        
        if avg_frame_time <= target_frame_time {
            self.current_pas.p = 1.0;
        } else {
            self.current_pas.p = (target_frame_time / avg_frame_time).max(0.0).min(1.0);
        }
    }

    pub fn update_system_health(&mut self, vram_usage: u64) {
        self.vram_usage_bytes = vram_usage;
        self.current_pas.s = (1.0 - (vram_usage as f32 / self.vram_limit_bytes as f32)).max(0.0).min(1.0);
    }

    pub fn set_aesthetic_entropy(&mut self, entropy: f32) {
        self.current_pas.a = (1.0 - entropy).max(0.0).min(1.0);
    }

    pub fn toggle_expansion(&mut self) -> bool {
        self.expanded = !self.expanded;
        self.expanded
    }

    /// Update System (S) component from tool health score
    ///
    /// This method integrates tool adapter health scores into the PAS
    /// System component. It blends the tool health with the existing
    /// VRAM-based system health.
    ///
    /// # Arguments
    /// * `tool_health_score` - Aggregated health from tool adapters (0.0 - 1.0)
    /// * `blend_weight` - How much to weight tool health vs VRAM health (0.0 - 1.0)
    ///                     Default: 0.5 (equal blend)
    pub fn update_system_from_tools(&mut self, tool_health_score: f32, blend_weight: Option<f32>) {
        let weight = blend_weight.unwrap_or(0.5);

        // Get current VRAM-based system health
        let vram_health = self.current_pas.s;

        // Blend tool health with VRAM health
        let blended_health = (tool_health_score * weight) + (vram_health * (1.0 - weight));

        self.current_pas.s = blended_health.max(0.0).min(1.0);

        log::debug!(
            "🔧 Diagnostic: Updated System health - Tool: {:.2}, VRAM: {:.2}, Blended: {:.2}",
            tool_health_score,
            vram_health,
            blended_health
        );
    }

    /// Phase 47: Update metabolic state from RISC-V executor
    pub fn update_metabolic_state(&mut self, metabolic: MetabolicState) {
        self.metabolic_state = metabolic;
    }

    /// Get the metabolic state for display/telemetry
    pub fn get_metabolic_state(&self) -> MetabolicState {
        self.metabolic_state
    }
}
