//! Neural City WASM Module - High Performance Simulation
//!
//! Targets 60 FPS with 10,000+ citizens via:
//! - Rust spatial indexing
//! - WASM for near-native speed
//! - Optional GPU compute via WebGPU

use wasm_bindgen::prelude::*;
use serde::{Serialize, Deserialize};
use std::collections::HashMap;

/// Spatial index cell size
const CELL_SIZE: usize = 64;

/// Citizen data optimized for WASM
#[wasm_bindgen]
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Citizen {
    pub id: u32,
    pub x: f32,
    pub y: f32,
    pub vx: f32,
    pub vy: f32,
    pub energy: f32,
    pub entropy: f32,
    pub guild: u8,      // 0-4: attention, memory, logic, substrate, intent
    pub state: u8,      // 0-6: dormant, active, trading, migrating, reproducing, declining, dead
    pub generation: u16,
    pub territory_radius: u16,
}

/// Spatial cell for neighbor queries
struct SpatialCell {
    citizens: Vec<u32>,
}

/// High-performance spatial index
pub struct SpatialIndex {
    width: usize,
    height: usize,
    cols: usize,
    rows: usize,
    cells: HashMap<usize, SpatialCell>,
    positions: HashMap<u32, (f32, f32)>,
}

impl SpatialIndex {
    pub fn new(width: usize, height: usize) -> Self {
        let cols = (width + CELL_SIZE - 1) / CELL_SIZE;
        let rows = (height + CELL_SIZE - 1) / CELL_SIZE;

        Self {
            width,
            height,
            cols,
            rows,
            cells: HashMap::new(),
            positions: HashMap::new(),
        }
    }

    fn cell_key(&self, cx: usize, cy: usize) -> usize {
        cy * self.cols + cx
    }

    fn get_cell_coords(&self, x: f32, y: f32) -> (usize, usize) {
        let cx = ((x as usize) / CELL_SIZE).min(self.cols - 1);
        let cy = ((y as usize) / CELL_SIZE).min(self.rows - 1);
        (cx, cy)
    }

    pub fn insert(&mut self, id: u32, x: f32, y: f32) {
        // Remove from old cell
        if let Some(&(_, _)) = self.positions.get(&id) {
            self.remove(id);
        }

        let (cx, cy) = self.get_cell_coords(x, y);
        let key = self.cell_key(cx, cy);

        self.cells.entry(key)
            .or_insert_with(|| SpatialCell { citizens: Vec::new() })
            .citizens.push(id);

        self.positions.insert(id, (x, y));
    }

    pub fn remove(&mut self, id: u32) {
        if let Some((x, y)) = self.positions.remove(&id) {
            let (cx, cy) = self.get_cell_coords(x, y);
            let key = self.cell_key(cx, cy);

            if let Some(cell) = self.cells.get_mut(&key) {
                cell.citizens.retain(|&cid| cid != id);
            }
        }
    }

    pub fn query_nearby(&self, x: f32, y: f32, radius: f32) -> Vec<u32> {
        let mut results = Vec::new();
        let radius_sq = radius * radius;

        let min_cx = ((x as usize).saturating_sub(radius as usize) / CELL_SIZE).max(0);
        let max_cx = (((x as usize) + (radius as usize)) / CELL_SIZE).min(self.cols - 1);
        let min_cy = ((y as usize).saturating_sub(radius as usize) / CELL_SIZE).max(0);
        let max_cy = (((y as usize) + (radius as usize)) / CELL_SIZE).min(self.rows - 1);

        for cy in min_cy..=max_cy {
            for cx in min_cx..=max_cx {
                let key = self.cell_key(cx, cy);
                if let Some(cell) = self.cells.get(&key) {
                    for &id in &cell.citizens {
                        if let Some(&(px, py)) = self.positions.get(&id) {
                            let dx = px - x;
                            let dy = py - y;
                            if dx * dx + dy * dy <= radius_sq {
                                results.push(id);
                            }
                        }
                    }
                }
            }
        }

        results
    }

    pub fn clear(&mut self) {
        self.cells.clear();
        self.positions.clear();
    }

    pub fn len(&self) -> usize {
        self.positions.len()
    }
}

/// High-performance Neural City simulation
#[wasm_bindgen]
pub struct NeuralCityWasm {
    citizens: HashMap<u32, Citizen>,
    spatial_index: SpatialIndex,
    next_id: u32,
    tick_count: u64,
    width: usize,
    height: usize,
}

#[wasm_bindgen]
impl NeuralCityWasm {
    #[wasm_bindgen(constructor)]
    pub fn new(width: usize, height: usize) -> Self {
        Self {
            citizens: HashMap::new(),
            spatial_index: SpatialIndex::new(width, height),
            next_id: 1,
            tick_count: 0,
            width,
            height,
        }
    }

    /// Add a citizen to the city
    #[wasm_bindgen]
    pub fn add_citizen(&mut self, x: f32, y: f32, guild: u8) -> u32 {
        let id = self.next_id;
        self.next_id += 1;

        let citizen = Citizen {
            id,
            x,
            y,
            vx: 0.0,
            vy: 0.0,
            energy: 1.0,
            entropy: 0.0,
            guild,
            state: 1, // active
            generation: 0,
            territory_radius: 16,
        };

        self.citizens.insert(id, citizen);
        self.spatial_index.insert(id, x, y);

        id
    }

    /// Remove a citizen
    #[wasm_bindgen]
    pub fn remove_citizen(&mut self, id: u32) {
        self.citizens.remove(&id);
        self.spatial_index.remove(id);
    }

    /// Get citizen count
    #[wasm_bindgen]
    pub fn count(&self) -> usize {
        self.citizens.len()
    }

    /// Run a simulation tick
    #[wasm_bindgen]
    pub fn tick(&mut self) -> TickResult {
        let start = std::time::Instant::now();

        let mut movements = 0usize;
        let mut trades = 0usize;
        let mut births = 0usize;
        let mut deaths = 0usize;

        // Update spatial index
        self.spatial_index.clear();
        for (&id, citizen) in &self.citizens {
            self.spatial_index.insert(id, citizen.x, citizen.y);
        }

        // Phase 1: Collect all pending trades (read-only)
        let pending_trades: Vec<(u32, u32, f32)> = {
            let mut trades_to_execute = Vec::new();
            for (&id, citizen) in &self.citizens {
                if citizen.state == 1 && citizen.energy > 0.3 {
                    let neighbors = self.spatial_index.query_nearby(citizen.x, citizen.y, 64.0);
                    for &neighbor_id in &neighbors {
                        if neighbor_id != id {
                            if let Some(neighbor) = self.citizens.get(&neighbor_id) {
                                if neighbor.guild != citizen.guild {
                                    let diff = citizen.energy - neighbor.energy;
                                    if diff.abs() > 0.1 {
                                        trades_to_execute.push((id, neighbor_id, diff.abs() * 0.1));
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            trades_to_execute
        };

        // Phase 2: Execute trades (mutable)
        for (citizen_id, neighbor_id, amount) in pending_trades {
            if let (Some(citizen), Some(neighbor)) =
                (self.citizens.get(&citizen_id), self.citizens.get(&neighbor_id))
            {
                let diff = citizen.energy - neighbor.energy;
                if diff > 0.0 {
                    if let Some(c) = self.citizens.get_mut(&citizen_id) {
                        c.energy -= amount;
                    }
                    if let Some(n) = self.citizens.get_mut(&neighbor_id) {
                        n.energy += amount * 0.9;
                    }
                    trades += 1;
                }
            }
        }

        // Phase 3: Movement and energy decay
        let ids: Vec<u32> = self.citizens.keys().copied().collect();
        for id in ids {
            if let Some(citizen) = self.citizens.get_mut(&id) {
                // Movement
                if citizen.state == 1 {  // active
                    let dx = (js_sys::Math::random() as f32 - 0.5) * 4.0;
                    let dy = (js_sys::Math::random() as f32 - 0.5) * 4.0;

                    citizen.x = (citizen.x + dx).max(0.0).min(self.width as f32 - 1.0);
                    citizen.y = (citizen.y + dy).max(0.0).min(self.height as f32 - 1.0);

                    movements += 1;
                }

                // Energy decay
                citizen.energy *= 0.999;

                // Death check
                if citizen.energy < 0.01 {
                    citizen.state = 6; // dead
                    deaths += 1;
                }
            }
        }

        // Remove dead citizens
        let dead: Vec<u32> = self.citizens.iter()
            .filter(|(_, c)| c.state == 6)
            .map(|(&id, _)| id)
            .collect();

        for id in dead {
            self.citizens.remove(&id);
            self.spatial_index.remove(id);
        }

        // Reproduction
        let reproducers: Vec<u32> = self.citizens.iter()
            .filter(|(_, c)| c.energy > 0.8 && c.state == 1)
            .map(|(&id, _)| id)
            .collect();

        for _ in reproducers.iter().take(10) {  // Limit births per tick
            births += 1;
            // Would add new citizen here
        }

        self.tick_count += 1;

        let elapsed = start.elapsed();

        TickResult {
            tick: self.tick_count,
            population: self.citizens.len(),
            movements,
            trades,
            births,
            deaths,
            elapsed_us: elapsed.as_micros() as u64,
        }
    }

    /// Get all citizens as JSON
    #[wasm_bindgen]
    pub fn get_citizens_json(&self) -> String {
        let citizens: Vec<&Citizen> = self.citizens.values().collect();
        serde_json::to_string(&citizens).unwrap_or_else(|_| "[]".to_string())
    }

    /// Get citizens in a region
    #[wasm_bindgen]
    pub fn get_citizens_in_region(&self, x: f32, y: f32, radius: f32) -> Vec<u32> {
        self.spatial_index.query_nearby(x, y, radius)
    }

    /// Get tick count
    #[wasm_bindgen]
    pub fn tick_count(&self) -> u64 {
        self.tick_count
    }
}

/// Result of a simulation tick
#[wasm_bindgen]
#[derive(Serialize)]
pub struct TickResult {
    pub tick: u64,
    pub population: usize,
    pub movements: usize,
    pub trades: usize,
    pub births: usize,
    pub deaths: usize,
    pub elapsed_us: u64,
}

#[wasm_bindgen]
impl TickResult {
    pub fn to_json(&self) -> String {
        serde_json::to_string(self).unwrap_or_else(|_| "{}".to_string())
    }
}

/// Initialize WASM module
#[wasm_bindgen(start)]
pub fn init() {
    // Enable console error logging
    #[cfg(feature = "console_error_panic_hook")]
    console_error_panic_hook::set_once();
}

// ============================================================================
// GPU Compute Shader (WGSL) for parallel citizen processing
// ============================================================================

pub const CITIZEN_COMPUTE_SHADER: &str = r#"
// Neural City GPU Compute Shader
// Processes citizens in parallel on GPU

struct Citizen {
    x: f32,
    y: f32,
    vx: f32,
    vy: f32,
    energy: f32,
    entropy: f32,
    guild: u32,
    state: u32,
    generation: u32,
    _padding: u32,
}

struct SimulationParams {
    width: f32,
    height: f32,
    dt: f32,
    energy_decay: f32,
    trade_radius: f32,
    neighbor_threshold: f32,
    reproduction_energy: f32,
    death_energy: f32,
}

@group(0) @binding(0) var<storage, read> citizens_in: array<Citizen>;
@group(0) @binding(1) var<storage, read_write> citizens_out: array<Citizen>;
@group(0) @binding(2) var<uniform> params: SimulationParams;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx = global_id.x;
    if (idx >= arrayLength(&citizens_in)) {
        return;
    }

    var citizen = citizens_in[idx];

    // Skip dead citizens
    if (citizen.state == 6u) {
        citizens_out[idx] = citizen;
        return;
    }

    // Movement (random walk)
    let rand_x = fract(sin(f32(idx) * 12.9898 + params.dt * 78.233) * 43758.5453);
    let rand_y = fract(cos(f32(idx) * 93.989 + params.dt * 28.153) * 23421.6312);

    citizen.vx = (rand_x - 0.5) * 4.0;
    citizen.vy = (rand_y - 0.5) * 4.0;

    citizen.x = clamp(citizen.x + citizen.vx, 0.0, params.width - 1.0);
    citizen.y = clamp(citizen.y + citizen.vy, 0.0, params.height - 1.0);

    // Energy decay
    citizen.energy *= params.energy_decay;

    // Death check
    if (citizen.energy < params.death_energy) {
        citizen.state = 6u;
    }

    citizens_out[idx] = citizen;
}
"#;

// ============================================================================
// Tests
// ============================================================================

#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::*;

    #[wasm_bindgen_test]
    fn test_spatial_index() {
        let mut index = SpatialIndex::new(1024, 1024);

        index.insert(1, 100.0, 100.0);
        index.insert(2, 110.0, 100.0);
        index.insert(3, 500.0, 500.0);

        let nearby = index.query_nearby(100.0, 100.0, 50.0);

        assert_eq!(nearby.len(), 2);
        assert!(nearby.contains(&1));
        assert!(nearby.contains(&2));
        assert!(!nearby.contains(&3));
    }

    #[wasm_bindgen_test]
    fn test_city_tick() {
        let mut city = NeuralCityWasm::new(512, 512);

        // Add 100 citizens
        for i in 0..100 {
            let x = (i % 10) as f32 * 50.0 + 25.0;
            let y = (i / 10) as f32 * 50.0 + 25.0;
            city.add_citizen(x, y, (i % 5) as u8);
        }

        assert_eq!(city.count(), 100);

        // Run tick
        let result = city.tick();

        assert_eq!(result.population, 100);
        assert!(result.elapsed_us < 1000); // Should be < 1ms for 100 citizens
    }

    #[wasm_bindgen_test]
    fn test_performance_1000_citizens() {
        let mut city = NeuralCityWasm::new(1024, 1024);

        // Add 1000 citizens
        for i in 0..1000 {
            let x = (i % 32) as f32 * 32.0 + 16.0;
            let y = (i / 32) as f32 * 32.0 + 16.0;
            city.add_citizen(x, y, (i % 5) as u8);
        }

        // Run 10 ticks and measure
        let mut total_us = 0u64;
        for _ in 0..10 {
            let result = city.tick();
            total_us += result.elapsed_us;
        }

        let avg_us = total_us / 10;
        let fps = 1_000_000 / avg_us;

        // Target: >= 60 FPS (16667 us per tick)
        assert!(avg_us < 17000, "Expected < 17ms per tick, got {}us", avg_us);
    }
}
