//! IPC Bridge for Python-Rust Tectonic Communication
//!
//! Provides file-based IPC between Python TectonicHandler and Rust TectonicSimulator.
//!
//! Protocol:
//! 1. Python writes `.geometry/tectonic/proposal.json`
//! 2. Rust polls and reads proposal
//! 3. Rust computes LayoutDelta via force-directed solver
//! 4. Rust writes `.geometry/tectonic/layout_delta.json`
//! 5. Python reads delta and applies to VAT

use std::path::{Path, PathBuf};
use std::fs;
use std::io::{self, Read, Write};
use std::time::{SystemTime, UNIX_EPOCH};

use serde::{Deserialize, Serialize};

use super::simulator::{TectonicSimulator, LayoutDelta, TileMovement, PulseEvent};
use super::{TileId, Coord, TectonicConfig};

/// State directory for IPC files
pub const TECTONIC_STATE_DIR: &str = ".geometry/tectonic";

/// Proposal file written by Python
pub const PROPOSAL_FILE: &str = "proposal.json";

/// Delta file written by Rust
pub const DELTA_FILE: &str = "layout_delta.json";

/// Status file for tracking
pub const STATUS_FILE: &str = "status.json";

/// A proposal from Python ConsensusEngine
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct TectonicProposal {
    pub proposal_id: String,
    pub bonds: Vec<BondData>,
    pub expected_improvement: f64,
    pub pulse_count: u32,
    pub timestamp: f64,
    pub format_version: String,
}

/// Bond data from Python
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct BondData {
    pub source: TileId,
    pub dest: TileId,
    pub strength: f64,
    pub volume: f64,
    #[serde(default)]
    pub pulse_count: u32,
    #[serde(default = "default_bond_type")]
    pub bond_type: String,
}

fn default_bond_type() -> String {
    "cognitive".to_string()
}

/// IPC Bridge for file-based communication
pub struct TectonicIpc {
    state_dir: PathBuf,
    last_proposal_id: Option<String>,
}

impl TectonicIpc {
    /// Create new IPC bridge with default state directory
    pub fn new() -> Self {
        Self {
            state_dir: PathBuf::from(TECTONIC_STATE_DIR),
            last_proposal_id: None,
        }
    }

    /// Create IPC bridge with custom state directory
    pub fn with_state_dir(dir: PathBuf) -> Self {
        Self {
            state_dir: dir,
            last_proposal_id: None,
        }
    }

    /// Check if a new proposal is available
    pub fn has_proposal(&self) -> bool {
        let proposal_path = self.state_dir.join(PROPOSAL_FILE);
        proposal_path.exists()
    }

    /// Read proposal from Python
    pub fn read_proposal(&self) -> io::Result<Option<TectonicProposal>> {
        let proposal_path = self.state_dir.join(PROPOSAL_FILE);

        if !proposal_path.exists() {
            return Ok(None);
        }

        let mut file = fs::File::open(&proposal_path)?;
        let mut contents = String::new();
        file.read_to_string(&mut contents)?;

        let proposal: TectonicProposal = serde_json::from_str(&contents)
            .map_err(|e| io::Error::new(io::ErrorKind::InvalidData, e))?;

        Ok(Some(proposal))
    }

    /// Write layout delta for Python to read
    pub fn write_delta(&self, delta: &LayoutDelta) -> io::Result<()> {
        // Ensure directory exists
        fs::create_dir_all(&self.state_dir)?;

        let delta_path = self.state_dir.join(DELTA_FILE);
        let json = serde_json::to_string_pretty(delta)
            .map_err(|e| io::Error::new(io::ErrorKind::InvalidData, e))?;

        let mut file = fs::File::create(&delta_path)?;
        file.write_all(json.as_bytes())?;

        Ok(())
    }

    /// Write status update
    pub fn write_status(&self, status: &TectonicStatus) -> io::Result<()> {
        fs::create_dir_all(&self.state_dir)?;

        let status_path = self.state_dir.join(STATUS_FILE);
        let json = serde_json::to_string_pretty(status)
            .map_err(|e| io::Error::new(io::ErrorKind::InvalidData, e))?;

        let mut file = fs::File::create(&status_path)?;
        file.write_all(json.as_bytes())?;

        Ok(())
    }

    /// Process a proposal through the simulator
    pub fn process_proposal(
        &mut self,
        proposal: &TectonicProposal,
        simulator: &mut TectonicSimulator,
    ) -> io::Result<LayoutDelta> {
        // Convert proposal bonds to pulse events for the simulator
        let timestamp = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_millis() as u64;

        for bond in &proposal.bonds {
            // Create pulse events based on bond volume
            // Higher volume = more pulses = stronger attraction
            let pulse_count = (bond.volume / 5.0).ceil() as usize;
            let volume_per_pulse = bond.volume / pulse_count.max(1) as f64;

            for _ in 0..pulse_count {
                let pulse = PulseEvent {
                    source: bond.source,
                    dest: bond.dest,
                    pulse_type: if bond.bond_type == "semantic" || bond.bond_type == "cyan" {
                        "cyan".to_string()
                    } else {
                        "violet".to_string()
                    },
                    volume: volume_per_pulse,
                    timestamp,
                };
                simulator.record_pulse(pulse);
            }
        }

        // Compute layout delta
        let delta = simulator.solve_layout();

        // Execute realignment (update internal state)
        simulator.execute_realignment(delta.clone())
            .map_err(|e| io::Error::new(io::ErrorKind::Other, e))?;

        // Track that we've processed this proposal
        self.last_proposal_id = Some(proposal.proposal_id.clone());

        Ok(delta)
    }

    /// Main polling function - check for proposals and process them
    ///
    /// Returns Some(delta) if a proposal was processed, None otherwise
    pub fn poll_and_process(
        &mut self,
        simulator: &mut TectonicSimulator,
    ) -> io::Result<Option<LayoutDelta>> {
        if !self.has_proposal() {
            return Ok(None);
        }

        match self.read_proposal()? {
            Some(proposal) => {
                // Check if we've already processed this proposal
                if self.last_proposal_id.as_ref() == Some(&proposal.proposal_id) {
                    return Ok(None);
                }

                log::info!(
                    "Processing tectonic proposal {} with {} bonds",
                    proposal.proposal_id,
                    proposal.bonds.len()
                );

                // Process through simulator
                let delta = self.process_proposal(&proposal, simulator)?;

                // Write delta for Python
                self.write_delta(&delta)?;

                // Update status
                let status = TectonicStatus {
                    state: "complete".to_string(),
                    proposal_id: Some(proposal.proposal_id),
                    last_cycle: simulator.cycle_count(),
                    top_bond: proposal.bonds.first().map(|b| (b.source, b.dest, b.strength)),
                    last_realignment: Some(SystemTime::now()
                        .duration_since(UNIX_EPOCH)
                        .unwrap()
                        .as_secs_f64()),
                    total_movements: delta.movements.len() as u32,
                    error: None,
                    timestamp: SystemTime::now()
                        .duration_since(UNIX_EPOCH)
                        .unwrap()
                        .as_secs_f64(),
                };
                self.write_status(&status)?;

                Ok(Some(delta))
            }
            None => Ok(None),
        }
    }

    /// Get the last processed proposal ID
    pub fn last_proposal_id(&self) -> Option<&str> {
        self.last_proposal_id.as_deref()
    }
}

impl Default for TectonicIpc {
    fn default() -> Self {
        Self::new()
    }
}

/// Status for Python to read
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct TectonicStatus {
    pub state: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub proposal_id: Option<String>,
    pub last_cycle: u64,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub top_bond: Option<(TileId, TileId, f64)>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub last_realignment: Option<f64>,
    pub total_movements: u32,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
    pub timestamp: f64,
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::TempDir;

    #[test]
    fn test_ipc_creation() {
        let ipc = TectonicIpc::new();
        assert!(!ipc.has_proposal());
    }

    #[test]
    fn test_read_write_proposal() {
        let temp_dir = TempDir::new().unwrap();
        let mut ipc = TectonicIpc::with_state_dir(temp_dir.path().to_path_buf());

        // Write a proposal
        let proposal = TectonicProposal {
            proposal_id: "test-001".to_string(),
            bonds: vec![
                BondData {
                    source: 1,
                    dest: 2,
                    strength: 0.9,
                    volume: 10.0,
                    pulse_count: 10,
                    bond_type: "cognitive".to_string(),
                }
            ],
            expected_improvement: 25.0,
            pulse_count: 10,
            timestamp: 1234567890.0,
            format_version: "1.0".to_string(),
        };

        // Write proposal file manually
        fs::create_dir_all(temp_dir.path()).unwrap();
        let proposal_path = temp_dir.path().join(PROPOSAL_FILE);
        let json = serde_json::to_string(&proposal).unwrap();
        fs::write(&proposal_path, &json).unwrap();

        // Read it back
        assert!(ipc.has_proposal());
        let read_proposal = ipc.read_proposal().unwrap();
        assert!(read_proposal.is_some());
        let read_proposal = read_proposal.unwrap();
        assert_eq!(read_proposal.proposal_id, "test-001");
        assert_eq!(read_proposal.bonds.len(), 1);
    }

    #[test]
    fn test_write_delta() {
        let temp_dir = TempDir::new().unwrap();
        let ipc = TectonicIpc::with_state_dir(temp_dir.path().to_path_buf());

        let delta = LayoutDelta {
            movements: vec![
                TileMovement {
                    tile_id: 1,
                    from: (0.0, 0.0),
                    to: (10.0, 10.0),
                    delta: 14.14,
                    saccade_gain: 5.0,
                }
            ],
            timestamp: 1234567890,
            before_saccade: 100.0,
            after_saccade: 95.0,
            improvement_pct: 5.0,
        };

        ipc.write_delta(&delta).unwrap();

        let delta_path = temp_dir.path().join(DELTA_FILE);
        assert!(delta_path.exists());

        let contents = fs::read_to_string(&delta_path).unwrap();
        let read_delta: LayoutDelta = serde_json::from_str(&contents).unwrap();
        assert_eq!(read_delta.movements.len(), 1);
    }
}
