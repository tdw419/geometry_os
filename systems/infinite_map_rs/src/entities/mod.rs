//! Entities module for Infinite Map
//!
//! This module contains entity structures that can be placed on the infinite map,
//! including shader execution zones and RTS particles.

pub mod execution_zone;
pub mod geometric_zone;
pub mod rts_particle;

pub use execution_zone::ExecutionZone;
pub use geometric_zone::GeometricZone;
pub use rts_particle::{EncodingMode, RTSMetadata, RTSParticle, SegmentInfo};
