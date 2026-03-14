//! Agency Tile - Spatial Persona Binding System
//!
//! This module implements the "Psychological Map" system where spatial position
//! in Hilbert space corresponds to cognitive state. When the viewport crosses
//! into a new Hilbert sector, the Rust compositor emits a PERSONA_SHIFT event
//! that triggers a monologue injection in the Python PixelBrain.
//!
//! # Sector Layout (125M Model)
//!
//! The Hilbert space is divided into 1M-unit sectors, each associated with
//! a specific AI persona:
//!
//! - 0 - 1M: Default (embeddings)
//! - 1M - 2M: Security Engineer
//! - 2M - 3M: Rapid Prototyper
//! - 3M - 4M: Reality Checker
//! - 4M - 5M: Backend Architect
//! - 5M - 6M: AI Engineer
//! - 6M - 7M: Performance Benchmarker
//! - 7M+: Default (LM Head)
//!
//! # Usage
//!
//! ```rust
//! use infinite_map_rs::agency_tile::{PersonaInjector, AgencyDivision};
//!
//! let mut injector = PersonaInjector::new();
//!
//! // When viewport moves
//! if let Some(shift_event) = injector.on_viewport_move(1_500_000) {
//!     println!("Persona shifted: {:?} -> {:?}",
//!              shift_event.from_persona,
//!              shift_event.to_persona);
//! }
//! ```

use serde::{Deserialize, Serialize};
use std::fmt;

/// Hilbert space bounds [start, end]
pub type HilbertBounds = (u64, u64);

/// Unique identifier for a persona
pub type PersonaId = String;

/// Agency division categories
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub enum AgencyDivision {
    /// Core engineering disciplines
    Engineering,
    /// Design and UX disciplines
    Design,
    /// Testing and QA disciplines
    Testing,
    /// Architecture and system design
    Architecture,
    /// Performance and optimization
    Performance,
    /// Security and safety
    Security,
    /// Default/fallback division
    Default,
}

impl fmt::Display for AgencyDivision {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            AgencyDivision::Engineering => write!(f, "Engineering"),
            AgencyDivision::Design => write!(f, "Design"),
            AgencyDivision::Testing => write!(f, "Testing"),
            AgencyDivision::Architecture => write!(f, "Architecture"),
            AgencyDivision::Performance => write!(f, "Performance"),
            AgencyDivision::Security => write!(f, "Security"),
            AgencyDivision::Default => write!(f, "Default"),
        }
    }
}

/// Color RGB values for frontend overlay
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Color {
    pub r: f32,
    pub g: f32,
    pub b: f32,
}

impl Color {
    /// Create a new RGB color
    pub fn new(r: f32, g: f32, b: f32) -> Self {
        Self { r, g, b }
    }

    /// Create color from hex (0xRRGGBB)
    pub fn from_hex(hex: u32) -> Self {
        Self {
            r: ((hex >> 16) & 0xFF) as f32 / 255.0,
            g: ((hex >> 8) & 0xFF) as f32 / 255.0,
            b: (hex & 0xFF) as f32 / 255.0,
        }
    }

    /// Create color from RGB u8 values
    pub fn from_rgb(r: u8, g: u8, b: u8) -> Self {
        Self {
            r: r as f32 / 255.0,
            g: g as f32 / 255.0,
            b: b as f32 / 255.0,
        }
    }
}

/// Agency Tile - Spatial persona binding
///
/// Represents a region in Hilbert space that is associated with a specific
/// AI persona. When the viewport enters this region, the system emits a
/// PERSONA_SHIFT event.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AgencyTile {
    /// Hilbert space bounds [start, end]
    pub bounds: HilbertBounds,
    /// Persona identifier (e.g., "security-engineer", "reality-checker")
    pub persona_id: PersonaId,
    /// Agency division category
    pub division: AgencyDivision,
    /// Color code for frontend overlay
    pub color_code: Color,
}

impl AgencyTile {
    /// Create a new agency tile
    pub fn new(
        bounds: HilbertBounds,
        persona_id: impl Into<String>,
        division: AgencyDivision,
        color_code: Color,
    ) -> Self {
        Self {
            bounds,
            persona_id: persona_id.into(),
            division,
            color_code,
        }
    }

    /// Check if a Hilbert position is within this tile
    pub fn contains(&self, position: u64) -> bool {
        position >= self.bounds.0 && (self.bounds.1 == u64::MAX || position < self.bounds.1)
    }

    /// Get the size of this tile in Hilbert space
    pub fn size(&self) -> u64 {
        self.bounds.1.saturating_sub(self.bounds.0)
    }
}

/// Event emitted when viewport crosses into a new persona sector
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PersonaShiftEvent {
    /// Previous persona (None if this is the first sector)
    pub from_persona: Option<PersonaId>,
    /// New persona we're entering
    pub to_persona: PersonaId,
    /// Hilbert position that triggered the shift
    pub trigger_position: u64,
    /// Bounds of the new sector
    pub sector_bounds: HilbertBounds,
    /// Division of the new persona
    pub division: AgencyDivision,
}

impl PersonaShiftEvent {
    /// Create a new persona shift event
    pub fn new(
        from_persona: Option<PersonaId>,
        to_persona: PersonaId,
        trigger_position: u64,
        sector_bounds: HilbertBounds,
        division: AgencyDivision,
    ) -> Self {
        Self {
            from_persona,
            to_persona,
            trigger_position,
            sector_bounds,
            division,
        }
    }

    /// Check if this is entering the first sector (no previous persona)
    pub fn is_initial_entry(&self) -> bool {
        self.from_persona.is_none()
    }
}

/// Persona injector that tracks viewport position and emits shift events
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PersonaInjector {
    /// All registered agency tiles
    tiles: Vec<AgencyTile>,
    /// Currently active persona
    active_persona: Option<PersonaId>,
    /// Current position in Hilbert space
    current_position: Option<u64>,
}

impl Default for PersonaInjector {
    fn default() -> Self {
        Self::new()
    }
}

impl PersonaInjector {
    /// Create a new persona injector with the default 125M model sectors
    pub fn new() -> Self {
        Self::with_tiles(Self::default_sectors())
    }

    /// Create a persona injector with custom tiles
    pub fn with_tiles(tiles: Vec<AgencyTile>) -> Self {
        Self {
            tiles,
            active_persona: None,
            current_position: None,
        }
    }

    /// Get the default sector layout for the 125M model
    fn default_sectors() -> Vec<AgencyTile> {
        vec![
            // 0 - 1M: Default (embeddings)
            AgencyTile::new(
                (0, 1_000_000),
                "default",
                AgencyDivision::Default,
                Color::from_hex(0x888888),
            ),
            // 1M - 2M: Security Engineer
            AgencyTile::new(
                (1_000_000, 2_000_000),
                "security-engineer",
                AgencyDivision::Security,
                Color::from_hex(0xFF6B6B),
            ),
            // 2M - 3M: Rapid Prototyper
            AgencyTile::new(
                (2_000_000, 3_000_000),
                "rapid-prototyper",
                AgencyDivision::Engineering,
                Color::from_hex(0x4ECDC4),
            ),
            // 3M - 4M: Reality Checker
            AgencyTile::new(
                (3_000_000, 4_000_000),
                "reality-checker",
                AgencyDivision::Testing,
                Color::from_hex(0xFFE66D),
            ),
            // 4M - 5M: Backend Architect
            AgencyTile::new(
                (4_000_000, 5_000_000),
                "backend-architect",
                AgencyDivision::Architecture,
                Color::from_hex(0x95E1D3),
            ),
            // 5M - 6M: AI Engineer
            AgencyTile::new(
                (5_000_000, 6_000_000),
                "ai-engineer",
                AgencyDivision::Engineering,
                Color::from_hex(0xA8E6CF),
            ),
            // 6M - 7M: Performance Benchmarker
            AgencyTile::new(
                (6_000_000, 7_000_000),
                "performance-benchmarker",
                AgencyDivision::Performance,
                Color::from_hex(0xFFD93D),
            ),
            // 7M+: Default (LM Head)
            AgencyTile::new(
                (7_000_000, u64::MAX),
                "default",
                AgencyDivision::Default,
                Color::from_hex(0x888888),
            ),
        ]
    }

    /// Called when viewport moves to a new Hilbert coordinate
    ///
    /// Returns `Some(PersonaShiftEvent)` if the viewport crossed into a new
    /// sector, `None` if still in the same sector.
    pub fn on_viewport_move(&mut self, position: u64) -> Option<PersonaShiftEvent> {
        // Find the tile for this position
        let new_tile = self.get_tile_at(position)?;

        let new_persona = new_tile.persona_id.clone();
        let division = new_tile.division.clone();
        let bounds = new_tile.bounds;

        // Check if we actually changed sectors
        if self.active_persona.as_ref() == Some(&new_persona) {
            self.current_position = Some(position);
            return None;
        }

        // Create shift event
        let event = PersonaShiftEvent::new(
            self.active_persona.clone(),
            new_persona.clone(),
            position,
            bounds,
            division,
        );

        self.active_persona = Some(new_persona);
        self.current_position = Some(position);

        Some(event)
    }

    /// Get persona for a specific Hilbert index
    pub fn get_persona_at(&self, position: u64) -> Option<&AgencyTile> {
        self.get_tile_at(position)
    }

    /// Get the tile at a specific Hilbert position
    fn get_tile_at(&self, position: u64) -> Option<&AgencyTile> {
        self.tiles.iter().find(|tile| tile.contains(position))
    }

    /// Get the currently active persona
    pub fn active_persona(&self) -> Option<&PersonaId> {
        self.active_persona.as_ref()
    }

    /// Get the current position in Hilbert space
    pub fn current_position(&self) -> Option<u64> {
        self.current_position
    }

    /// Get all registered tiles
    pub fn tiles(&self) -> &[AgencyTile] {
        &self.tiles
    }

    /// Add a custom tile to the injector
    ///
    /// Returns `true` if the tile was added, `false` if it overlaps
    /// with an existing tile.
    pub fn add_tile(&mut self, tile: AgencyTile) -> bool {
        // Check for overlaps
        for existing in &self.tiles {
            let overlaps = tile.bounds.0 < existing.bounds.1
                && tile.bounds.1 > existing.bounds.0;
            if overlaps {
                return false;
            }
        }

        self.tiles.push(tile);
        true
    }

    /// Clear all tiles and reset to default sectors
    pub fn reset_to_default(&mut self) {
        self.tiles = Self::default_sectors();
        self.active_persona = None;
        self.current_position = None;
    }

    /// Reset the active persona (useful when restarting navigation)
    pub fn reset_active_persona(&mut self) {
        self.active_persona = None;
        self.current_position = None;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_color_from_hex() {
        let color = Color::from_hex(0xFF6B6B);
        assert!((color.r - 1.0).abs() < 0.01);
        assert!((color.g - 0.42).abs() < 0.01);
        assert!((color.b - 0.42).abs() < 0.01);
    }

    #[test]
    fn test_color_from_rgb() {
        let color = Color::from_rgb(255, 100, 50);
        assert!((color.r - 1.0).abs() < 0.01);
        assert!((color.g - 0.39).abs() < 0.01);
        assert!((color.b - 0.20).abs() < 0.01);
    }

    #[test]
    fn test_agency_tile_contains() {
        let tile = AgencyTile::new(
            (1_000_000, 2_000_000),
            "test",
            AgencyDivision::Engineering,
            Color::from_hex(0xFFFFFF),
        );

        assert!(tile.contains(1_000_000));
        assert!(tile.contains(1_500_000));
        assert!(!tile.contains(999_999));
        assert!(!tile.contains(2_000_000));
    }

    #[test]
    fn test_agency_tile_size() {
        let tile = AgencyTile::new(
            (1_000_000, 2_000_000),
            "test",
            AgencyDivision::Engineering,
            Color::from_hex(0xFFFFFF),
        );

        assert_eq!(tile.size(), 1_000_000);
    }

    #[test]
    fn test_default_sectors() {
        let injector = PersonaInjector::new();
        assert_eq!(injector.tiles().len(), 8);

        // Check specific sectors
        let security = injector.get_persona_at(1_500_000);
        assert!(security.is_some());
        assert_eq!(security.unwrap().persona_id, "security-engineer");

        let prototyper = injector.get_persona_at(2_500_000);
        assert!(prototyper.is_some());
        assert_eq!(prototyper.unwrap().persona_id, "rapid-prototyper");
    }

    #[test]
    fn test_viewport_move_crosses_sector() {
        let mut injector = PersonaInjector::new();

        // First move should trigger initial entry
        let event = injector.on_viewport_move(500_000);
        assert!(event.is_some());
        let event = event.unwrap();
        assert!(event.is_initial_entry());
        assert_eq!(event.to_persona, "default");
        assert_eq!(injector.active_persona(), Some(&"default".to_string()));

        // Move within same sector - no event
        let event = injector.on_viewport_move(750_000);
        assert!(event.is_none());

        // Cross into security sector
        let event = injector.on_viewport_move(1_500_000);
        assert!(event.is_some());
        let event = event.unwrap();
        assert!(!event.is_initial_entry());
        assert_eq!(event.from_persona, Some("default".to_string()));
        assert_eq!(event.to_persona, "security-engineer");
        assert_eq!(event.division, AgencyDivision::Security);
    }

    #[test]
    fn test_viewport_move_multiple_sectors() {
        let mut injector = PersonaInjector::new();
        let mut events = Vec::new();

        // Simulate moving through multiple sectors
        let positions = vec![
            500_000,    // default
            1_500_000,  // security-engineer
            2_500_000,  // rapid-prototyper
            3_500_000,  // reality-checker
            4_500_000,  // backend-architect
        ];

        for pos in positions {
            if let Some(event) = injector.on_viewport_move(pos) {
                events.push(event);
            }
        }

        assert_eq!(events.len(), 5);
        assert_eq!(events[0].to_persona, "default");
        assert_eq!(events[1].to_persona, "security-engineer");
        assert_eq!(events[2].to_persona, "rapid-prototyper");
        assert_eq!(events[3].to_persona, "reality-checker");
        assert_eq!(events[4].to_persona, "backend-architect");
    }

    #[test]
    fn test_get_persona_at() {
        let injector = PersonaInjector::new();

        assert_eq!(
            injector.get_persona_at(0).unwrap().persona_id,
            "default"
        );
        assert_eq!(
            injector.get_persona_at(1_500_000).unwrap().persona_id,
            "security-engineer"
        );
        assert_eq!(
            injector.get_persona_at(2_500_000).unwrap().persona_id,
            "rapid-prototyper"
        );
        assert_eq!(
            injector.get_persona_at(10_000_000).unwrap().persona_id,
            "default"
        );
    }

    #[test]
    fn test_add_tile_no_overlap() {
        let mut injector = PersonaInjector::new();

        // Add a tile in a gap (shouldn't overlap with default sectors)
        let custom_tile = AgencyTile::new(
            (8_000_000, 9_000_000),
            "custom",
            AgencyDivision::Engineering,
            Color::from_hex(0xFFFFFF),
        );

        // This should fail because 8M is in the default sector (7M-MAX)
        assert!(!injector.add_tile(custom_tile));
    }

    #[test]
    fn test_add_tile_with_reset() {
        let mut injector = PersonaInjector::new();
        injector.reset_to_default();
        injector.reset_active_persona();

        assert_eq!(injector.active_persona(), None);
        assert_eq!(injector.current_position(), None);
    }

    #[test]
    fn test_persona_shift_event_bounds() {
        let mut injector = PersonaInjector::new();

        injector.on_viewport_move(1_500_000);
        let event = injector.on_viewport_move(2_500_000).unwrap();

        assert_eq!(event.sector_bounds, (2_000_000, 3_000_000));
        assert_eq!(event.trigger_position, 2_500_000);
    }

    #[test]
    fn test_edge_case_sector_boundaries() {
        let injector = PersonaInjector::new();

        // Exactly at boundary
        assert_eq!(
            injector.get_persona_at(1_000_000).unwrap().persona_id,
            "security-engineer"
        );

        // One before boundary
        assert_eq!(
            injector.get_persona_at(999_999).unwrap().persona_id,
            "default"
        );

        // Last position in sector
        assert_eq!(
            injector.get_persona_at(1_999_999).unwrap().persona_id,
            "security-engineer"
        );
    }

    #[test]
    fn test_agency_division_display() {
        assert_eq!(format!("{}", AgencyDivision::Engineering), "Engineering");
        assert_eq!(format!("{}", AgencyDivision::Security), "Security");
        assert_eq!(format!("{}", AgencyDivision::Default), "Default");
    }

    #[test]
    fn test_upper_bound_edge_case() {
        let injector = PersonaInjector::new();

        // Test the last sector (7M-MAX)
        let tile = injector.get_persona_at(u64::MAX);
        assert!(tile.is_some());
        assert_eq!(tile.unwrap().persona_id, "default");

        let tile = injector.get_persona_at(7_000_000);
        assert!(tile.is_some());
        assert_eq!(tile.unwrap().persona_id, "default");
    }

    #[test]
    fn test_with_custom_tiles() {
        let custom_tiles = vec![
            AgencyTile::new(
                (0, 100),
                "tiny-1",
                AgencyDivision::Engineering,
                Color::from_hex(0xFF0000),
            ),
            AgencyTile::new(
                (100, 200),
                "tiny-2",
                AgencyDivision::Design,
                Color::from_hex(0x00FF00),
            ),
        ];

        let mut injector = PersonaInjector::with_tiles(custom_tiles);

        let event1 = injector.on_viewport_move(50);
        assert!(event1.is_some());
        assert_eq!(event1.unwrap().to_persona, "tiny-1");

        let event2 = injector.on_viewport_move(150);
        assert!(event2.is_some());
        assert_eq!(event2.unwrap().to_persona, "tiny-2");
    }
}
