//! Geodetic coordinate types for WorldView Morphological Layer.
//!
//! Provides WGS84 geodetic coordinates and transformations for mapping
//! Hilbert space addresses to real-world geographic locations.

use crate::hilbert::{d2xy, xy2d};

/// WGS84 Geodetic coordinates (latitude, longitude, altitude).
///
/// This type represents a point on or above Earth's surface using the
/// WGS84 reference ellipsoid, which is the standard for GPS.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct GeodeticCoords {
    /// Latitude in degrees (-90 to 90, positive = North)
    pub latitude: f64,
    /// Longitude in degrees (-180 to 180, positive = East)
    pub longitude: f64,
    /// Altitude in meters above sea level
    pub altitude: f64,
}

impl GeodeticCoords {
    /// The Capital anchor point (Texas State Capitol).
    ///
    /// The core kernel (Hilbert addresses 0x00000000 - 0x00FFFFFF)
    /// is anchored to the Texas State Capitol building in Austin.
    ///
    /// This serves as the origin point for the WorldView morphological
    /// layer's geospatial mapping.
    pub fn capital_anchor() -> Self {
        Self {
            latitude: 30.2747,
            longitude: -97.7403,
            altitude: 150.0,
        }
    }

    /// Create new geodetic coordinates.
    pub fn new(latitude: f64, longitude: f64, altitude: f64) -> Self {
        Self {
            latitude,
            longitude,
            altitude,
        }
    }
}

/// Configuration for Hilbert-to-Geodetic projection.
///
/// Maps Hilbert curve indices to WGS84 geodetic coordinates.
/// The projection is centered on a "Capital anchor" point, with
/// the Hilbert grid extending outward from that center.
///
/// At 64x64 grid with 0.01 degrees per cell, each cell is approximately
/// 1km at Austin latitude (30.27 degrees North).
#[derive(Debug, Clone)]
pub struct HilbertGeodeticProjection {
    /// Grid size (must be power of 2)
    pub grid_size: u32,
    /// The Capital anchor point (center of the projection)
    pub center: GeodeticCoords,
    /// Degrees per grid cell (zoom level control)
    pub degrees_per_cell: f64,
}

impl HilbertGeodeticProjection {
    /// Create projection centered on Capital anchor.
    ///
    /// The Capital anchor is the Texas State Capitol building in Austin.
    /// Hilbert index 0 maps to this location.
    ///
    /// # Arguments
    ///
    /// * `grid_size` - Size of the Hilbert grid (must be power of 2)
    ///
    /// # Panics
    ///
    /// Panics if `grid_size` is not a power of 2.
    ///
    /// # Examples
    ///
    /// ```
    /// use infinite_map_rs::geodetic::HilbertGeodeticProjection;
    /// let proj = HilbertGeodeticProjection::new(64);
    /// assert_eq!(proj.grid_size, 64);
    /// ```
    pub fn new(grid_size: u32) -> Self {
        assert!(grid_size.is_power_of_two(), "Grid size must be power of 2");

        // Default: 0.01 degrees per cell ≈ 1km at Austin latitude
        let degrees_per_cell = 0.01;

        Self {
            grid_size,
            center: GeodeticCoords::capital_anchor(),
            degrees_per_cell,
        }
    }

    /// Create projection with custom parameters.
    ///
    /// # Arguments
    ///
    /// * `grid_size` - Size of the Hilbert grid (must be power of 2)
    /// * `center` - Center point for the projection
    /// * `degrees_per_cell` - Spatial resolution in degrees
    pub fn with_config(
        grid_size: u32,
        center: GeodeticCoords,
        degrees_per_cell: f64,
    ) -> Self {
        assert!(grid_size.is_power_of_two(), "Grid size must be power of 2");

        Self {
            grid_size,
            center,
            degrees_per_cell,
        }
    }

    /// Convert Hilbert index to geodetic coordinates.
    ///
    /// Uses the Hilbert curve to preserve spatial locality - adjacent
    /// Hilbert indices will map to nearby geographic locations.
    ///
    /// # Arguments
    ///
    /// * `hilbert_index` - Distance along the Hilbert curve (0 to grid_size²-1)
    ///
    /// # Returns
    ///
    /// Geodetic coordinates corresponding to the Hilbert index.
    /// The altitude is inherited from the center point.
    ///
    /// # Examples
    ///
    /// ```
    /// use infinite_map_rs::geodetic::HilbertGeodeticProjection;
    /// let proj = HilbertGeodeticProjection::new(64);
    /// // Use center_index() to get the Hilbert index at the Capital anchor
    /// let coords = proj.hilbert_to_geodetic(proj.center_index());
    /// assert!((coords.latitude - 30.2747).abs() < 0.01);
    /// ```
    pub fn hilbert_to_geodetic(&self, hilbert_index: u64) -> GeodeticCoords {
        // Convert Hilbert index to (x, y) grid coordinates
        let (x, y) = d2xy(self.grid_size, hilbert_index);

        // Grid center is at (half_grid, half_grid).
        // We interpret the grid center as the Capital anchor.
        // So (x, y) offset from center is (x - half_grid, y - half_grid).
        let half_grid = (self.grid_size / 2) as f64;

        // Calculate offset from center in grid cells
        let dx = x as f64 - half_grid;
        let dy = y as f64 - half_grid;

        // Convert to degrees
        // Note: Latitude increases North (positive y), Longitude increases East (positive x)
        let latitude = self.center.latitude + dy * self.degrees_per_cell;
        let longitude = self.center.longitude + dx * self.degrees_per_cell;

        GeodeticCoords {
            latitude,
            longitude,
            altitude: self.center.altitude,
        }
    }

    /// Get the Hilbert index at the grid center (Capital anchor).
    ///
    /// This is the "origin" index that maps to the Capital anchor.
    ///
    /// # Examples
    ///
    /// ```
    /// use infinite_map_rs::geodetic::HilbertGeodeticProjection;
    /// let proj = HilbertGeodeticProjection::new(64);
    /// let center_idx = proj.center_index();
    /// let coords = proj.hilbert_to_geodetic(center_idx);
    /// // Center index maps exactly to Capital anchor
    /// assert!((coords.latitude - 30.2747).abs() < 0.01);
    /// ```
    pub fn center_index(&self) -> u64 {
        let half_grid = self.grid_size / 2;
        xy2d(self.grid_size, half_grid, half_grid)
    }

    /// Convert geodetic coordinates to Hilbert index.
    ///
    /// This is the inverse of `hilbert_to_geodetic`.
    ///
    /// # Arguments
    ///
    /// * `coords` - Geodetic coordinates to convert
    ///
    /// # Returns
    ///
    /// Hilbert index corresponding to the coordinates.
    ///
    /// # Note
    ///
    /// Due to quantization, the round-trip may not be exact for coordinates
    /// that don't fall exactly on grid cell centers.
    ///
    /// # Examples
    ///
    /// ```
    /// use infinite_map_rs::geodetic::{GeodeticCoords, HilbertGeodeticProjection};
    /// let proj = HilbertGeodeticProjection::new(64);
    /// let capital = GeodeticCoords::capital_anchor();
    /// let idx = proj.geodetic_to_hilbert(&capital);
    /// // Capital anchor should map to near origin
    /// assert!(idx < 10);
    /// ```
    pub fn geodetic_to_hilbert(&self, coords: &GeodeticCoords) -> u64 {
        // Calculate offset from center in degrees
        let d_lat = coords.latitude - self.center.latitude;
        let d_lon = coords.longitude - self.center.longitude;

        // Convert to grid cell offset
        let dy = d_lat / self.degrees_per_cell;
        let dx = d_lon / self.degrees_per_cell;

        // Convert to grid coordinates (centered)
        let half_grid = (self.grid_size / 2) as f64;
        let x = (dx + half_grid).round() as u32;
        let y = (dy + half_grid).round() as u32;

        // Clamp to valid range
        let x = x.min(self.grid_size - 1);
        let y = y.min(self.grid_size - 1);

        // Convert to Hilbert index
        xy2d(self.grid_size, x, y)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_geodetic_coords_creation() {
        let coords = GeodeticCoords {
            latitude: 30.267,
            longitude: -97.743,
            altitude: 100.0,
        };
        assert!((coords.latitude - 30.267).abs() < 0.001);
        assert!((coords.longitude - (-97.743)).abs() < 0.001);
        assert!((coords.altitude - 100.0).abs() < 0.001);
    }

    #[test]
    fn test_capital_anchor() {
        // Texas State Capitol coordinates
        let capital = GeodeticCoords::capital_anchor();
        assert!((capital.latitude - 30.2747).abs() < 0.001);
        assert!((capital.longitude - (-97.7403)).abs() < 0.001);
        assert!((capital.altitude - 150.0).abs() < 0.001);
    }

    #[test]
    fn test_geodetic_coords_new() {
        let coords = GeodeticCoords::new(45.0, -120.0, 500.0);
        assert!((coords.latitude - 45.0).abs() < 0.001);
        assert!((coords.longitude - (-120.0)).abs() < 0.001);
        assert!((coords.altitude - 500.0).abs() < 0.001);
    }

    #[test]
    fn test_geodetic_coords_equality() {
        let a = GeodeticCoords::capital_anchor();
        let b = GeodeticCoords::capital_anchor();
        assert_eq!(a, b);
    }

    // ========================================
    // HilbertGeodeticProjection Tests
    // ========================================

    #[test]
    fn test_hilbert_to_geodetic_origin() {
        // Center index should map to Capital anchor
        let proj = HilbertGeodeticProjection::new(64);
        let center_idx = proj.center_index();
        let coords = proj.hilbert_to_geodetic(center_idx);

        let capital = GeodeticCoords::capital_anchor();

        // Center should map exactly to Capital anchor (within floating point tolerance)
        assert!(
            (coords.latitude - capital.latitude).abs() < 0.0001,
            "Latitude {} too far from capital {}",
            coords.latitude,
            capital.latitude
        );
        assert!(
            (coords.longitude - capital.longitude).abs() < 0.0001,
            "Longitude {} too far from capital {}",
            coords.longitude,
            capital.longitude
        );
        assert!(
            (coords.altitude - capital.altitude).abs() < 0.0001,
            "Altitude {} too far from capital {}",
            coords.altitude,
            capital.altitude
        );
    }

    #[test]
    fn test_hilbert_to_geodetic_locality() {
        // Adjacent indices produce close coordinates
        let proj = HilbertGeodeticProjection::new(64);

        let coords_0 = proj.hilbert_to_geodetic(0);
        let coords_1 = proj.hilbert_to_geodetic(1);
        let coords_2 = proj.hilbert_to_geodetic(2);

        // Adjacent Hilbert indices should be within 1-2 cell distances
        let max_distance = 2.0 * proj.degrees_per_cell;

        let dist_0_1 = ((coords_0.latitude - coords_1.latitude).powi(2)
            + (coords_0.longitude - coords_1.longitude).powi(2))
        .sqrt();
        let dist_1_2 = ((coords_1.latitude - coords_2.latitude).powi(2)
            + (coords_1.longitude - coords_2.longitude).powi(2))
        .sqrt();

        assert!(
            dist_0_1 < max_distance,
            "Indices 0 and 1 too far apart: {}",
            dist_0_1
        );
        assert!(
            dist_1_2 < max_distance,
            "Indices 1 and 2 too far apart: {}",
            dist_1_2
        );
    }

    #[test]
    fn test_projection_round_trip() {
        // Round-trip should be consistent for cell centers
        let proj = HilbertGeodeticProjection::new(64);

        for idx in [0, 1, 100, 1000, 2000, 3000] {
            let coords = proj.hilbert_to_geodetic(idx);
            let recovered = proj.geodetic_to_hilbert(&coords);

            // Due to Hilbert curve locality, recovered index should be
            // very close to original (within a few indices)
            let diff = (recovered as i64 - idx as i64).abs();
            assert!(
                diff < 5,
                "Round trip failed for index {}: got {} (diff {})",
                idx,
                recovered,
                diff
            );
        }
    }

    #[test]
    fn test_projection_grid_size() {
        let proj = HilbertGeodeticProjection::new(128);
        assert_eq!(proj.grid_size, 128);

        // Max index should be within bounds
        let max_idx = (128 * 128 - 1) as u64;
        let coords = proj.hilbert_to_geodetic(max_idx);
        assert!(coords.latitude.abs() <= 90.0);
        assert!(coords.longitude.abs() <= 180.0);
    }

    #[test]
    fn test_projection_custom_center() {
        let custom_center = GeodeticCoords::new(40.7128, -74.0060, 10.0); // NYC
        let proj = HilbertGeodeticProjection::with_config(64, custom_center, 0.01);

        let center_idx = proj.center_index();
        let coords = proj.hilbert_to_geodetic(center_idx);

        // Center index should map exactly to custom center
        assert!((coords.latitude - 40.7128).abs() < 0.001);
        assert!((coords.longitude - (-74.0060)).abs() < 0.001);
        assert!((coords.altitude - 10.0).abs() < 0.001);
    }

    #[test]
    #[should_panic(expected = "Grid size must be power of 2")]
    fn test_projection_invalid_grid_size() {
        let _ = HilbertGeodeticProjection::new(100);
    }
}
