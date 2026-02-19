//! ASCII Renderer for Tectonic Activity Monitor.
//!
//! Emits tectonic_activity.ascii for AI observability.

use std::fs;
use std::io::Write;
use std::path::PathBuf;

use super::bonds::{CognitiveBond, BondType, BondGraphStats};
use super::simulator::{TectonicState, TileMovement, LayoutDelta};

/// ASCII renderer for tectonic activity
pub struct TectonicAsciiRenderer {
    output_dir: PathBuf,
}

impl TectonicAsciiRenderer {
    pub fn new(output_dir: PathBuf) -> Self {
        // Ensure directory exists
        if !output_dir.exists() {
            let _ = fs::create_dir_all(&output_dir);
        }
        Self { output_dir }
    }

    /// Emit tectonic_activity.ascii
    pub fn emit(&self, state: &TectonicState) -> Result<(), String> {
        let content = self.render(state);
        self.write_file("tectonic_activity.ascii", &content)
    }

    fn render(&self, state: &TectonicState) -> String {
        let mut lines = Vec::new();

        // Header
        lines.push("┌──────────────────────────────────────────────────────────────────────────┐".to_string());
        lines.push(format!("│ TECTONIC ACTIVITY MONITOR                                 Cycle: {:<5} │", state.cycle));
        lines.push("├──────────────────────────────────────────────────────────────────────────┤".to_string());
        lines.push("│                                                                          │".to_string());

        // Cognitive Bonds Section
        lines.push("│   COGNITIVE BONDS (top 10 by strength)                                  │".to_string());
        lines.push("│   ────────────────────────────────────                                  │".to_string());

        for bond in state.top_bonds.iter().take(10) {
            let bond_type_str = match bond.bond_type {
                BondType::Cognitive => "[COGNITIVE]",
                BondType::Semantic => "[SEMANTIC] ",
                BondType::Hybrid => "[HYBRID]   ",
            };

            let bar_len = (bond.strength * 20.0) as usize;
            let bar = "═".repeat(bar_len.min(20));
            let bar_padded = format!("{:<20}", bar);

            lines.push(format!(
                "│   DIST-{} {}► DIST-{}   {:.2}  {}              │",
                bond.source,
                bar_padded,
                bond.dest,
                bond.strength,
                bond_type_str
            ));
        }

        lines.push("│                                                                          │".to_string());

        // Pending Realignments Section
        lines.push("│   PENDING REALIGNMENTS                                                  │".to_string());
        lines.push("│   ────────────────────                                                  │".to_string());

        for movement in state.pending_movements.iter().take(5) {
            let gain_sign = if movement.saccade_gain >= 0.0 { "+" } else { "" };
            lines.push(format!(
                "│   DIST-{}: ({:.0}, {:.0}) → ({:.0}, {:.0})  Δ={:.0}px  Saccade: {}{:.0}%     │",
                movement.tile_id,
                movement.from.0, movement.from.1,
                movement.to.0, movement.to.1,
                movement.delta,
                gain_sign,
                movement.saccade_gain
            ));
        }

        if state.pending_movements.is_empty() {
            lines.push("│   No pending realignments                                               │".to_string());
        }

        lines.push("│                                                                          │".to_string());

        // Aggregation Window Section
        lines.push("│   AGGREGATION WINDOW                                                    │".to_string());
        lines.push("│   ───────────────────                                                   │".to_string());
        lines.push(format!("│   Pulses recorded: {:<10}                                             │", state.stats.total_pulses));
        lines.push(format!("│   Active edges: {:<10}                                               │", state.stats.total_edges));
        lines.push(format!("│   Active tiles: {:<10}                                                │", state.stats.active_tiles));
        lines.push(format!("│   Cycle: {:<10}                                                       │", state.cycle));

        lines.push("│                                                                          │".to_string());

        // Spatial Metrics Section
        lines.push("│   SPATIAL METRICS                                                       │".to_string());
        lines.push("│   ───────────────                                                       │".to_string());

        let improvement_sign = if state.layout_delta.improvement_pct >= 0.0 { "↓" } else { "↑" };
        lines.push(format!(
            "│   Avg Saccade: {:.0}px → {:.0}px ({}{:.0}%)                            │",
            state.layout_delta.before_saccade,
            state.layout_delta.after_saccade,
            improvement_sign,
            state.layout_delta.improvement_pct.abs()
        ));

        lines.push(format!(
            "│   Hilbert Preservation: {:.1}%                                          │",
            state.hilbert_preservation * 100.0
        ));

        // Layout entropy (simplified: based on position variance)
        let entropy = if state.stats.active_tiles > 0 {
            1.0 - state.hilbert_preservation
        } else {
            0.0
        };
        let entropy_status = if entropy < 0.3 { "healthy" } else if entropy < 0.6 { "moderate" } else { "high" };
        lines.push(format!("│   Layout Entropy: {:.2} ({})                                            │", entropy, entropy_status));

        lines.push("│                                                                          │".to_string());
        lines.push("└──────────────────────────────────────────────────────────────────────────┘".to_string());

        lines.join("\n")
    }

    fn write_file(&self, filename: &str, content: &str) -> Result<(), String> {
        let path = self.output_dir.join(filename);
        let temp_path = self.output_dir.join(format!("{}.tmp", filename));

        // Atomic write: write to temp, then rename
        let mut file = fs::File::create(&temp_path)
            .map_err(|e| format!("Failed to create temp file: {}", e))?;

        file.write_all(content.as_bytes())
            .map_err(|e| format!("Failed to write content: {}", e))?;

        fs::rename(&temp_path, &path)
            .map_err(|e| format!("Failed to rename file: {}", e))?;

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_ascii_render() {
        let temp_dir = std::env::temp_dir().join("tectonic_ascii_test");
        let renderer = TectonicAsciiRenderer::new(temp_dir.clone());

        let state = TectonicState {
            cycle: 42,
            top_bonds: vec![
                CognitiveBond {
                    source: 0,
                    dest: 1,
                    strength: 0.92,
                    bond_type: BondType::Cognitive,
                    pulse_count: 15847,
                },
            ],
            pending_movements: vec![
                TileMovement {
                    tile_id: 0,
                    from: (1024.0, 512.0),
                    to: (1080.0, 480.0),
                    delta: 44.0,
                    saccade_gain: 12.0,
                },
            ],
            stats: BondGraphStats {
                total_edges: 15,
                total_volume: 1000.0,
                total_pulses: 15847,
                active_tiles: 8,
            },
            layout_delta: LayoutDelta {
                movements: vec![],
                timestamp: 0,
                before_saccade: 847.0,
                after_saccade: 523.0,
                improvement_pct: 38.0,
            },
            hilbert_preservation: 0.942,
        };

        let result = renderer.emit(&state);
        assert!(result.is_ok());

        // Check file was created
        let path = temp_dir.join("tectonic_activity.ascii");
        assert!(path.exists());

        // Cleanup
        let _ = std::fs::remove_dir_all(temp_dir);
    }
}
