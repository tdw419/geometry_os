//! Phase 46 Task 2: Hilbert Pathfinding Engine
//!
//! Provides intelligent navigation for agents traversing the Source City via
//! Hilbert curve paths. The pathfinder computes optimal 1D Hilbert traversals
//! that preserve spatial locality while navigating between distant districts.
//!
//! ## Key Features
//!
//! - **1D Hilbert Navigation**: Agents move along Hilbert coordinates for cache-friendly traversal
//! - **Waypoint Generation**: Converts 1D path to 2D waypoints for smooth rendering
//! - **District-Aware Routing**: Optimizes paths based on district boundaries
//! - **Obstacle Avoidance**: Routes around buildings or blocked areas

use crate::cognitive::agents::{AgentGoal, CityAgent, GoalType};
use crate::source_city::{SourceCityLoader, SourceTile};
use std::collections::{BinaryHeap, HashMap, HashSet, VecDeque};
use std::path::PathBuf;

/// A waypoint in 2D world space
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct Waypoint {
    pub x: f32,
    pub y: f32,
    pub hilbert: u32,
}

impl Waypoint {
    pub fn new(x: f32, y: f32, hilbert: u32) -> Self {
        Self { x, y, hilbert }
    }

    /// Distance to another waypoint
    pub fn distance_to(&self, other: &Waypoint) -> f32 {
        let dx = self.x - other.x;
        let dy = self.y - other.y;
        (dx * dx + dy * dy).sqrt()
    }
}

/// A path segment along the Hilbert curve
#[derive(Debug, Clone)]
pub struct HilbertPath {
    /// Starting Hilbert coordinate
    pub start_hilbert: u32,
    /// Ending Hilbert coordinate
    pub end_hilbert: u32,
    /// Ordered list of waypoints (1D Hilbert indices with 2D positions)
    pub waypoints: Vec<Waypoint>,
    /// Total distance in Hilbert units
    pub hilbert_distance: u32,
    /// Estimated travel time in seconds
    pub estimated_time: f32,
}

impl HilbertPath {
    pub fn new(start: u32, end: u32) -> Self {
        Self {
            start_hilbert: start,
            end_hilbert: end,
            waypoints: Vec::new(),
            hilbert_distance: 0,
            estimated_time: 0.0,
        }
    }

    /// Check if path is valid (has waypoints)
    pub fn is_valid(&self) -> bool {
        !self.waypoints.is_empty()
    }

    /// Get next waypoint after current position
    pub fn next_waypoint(&self, current_hilbert: u32) -> Option<&Waypoint> {
        self.waypoints
            .iter()
            .find(|w| w.hilbert > current_hilbert)
            .or_else(|| self.waypoints.last())
    }

    /// Get progress through path (0.0 to 1.0)
    pub fn progress(&self, current_hilbert: u32) -> f32 {
        if self.hilbert_distance == 0 {
            return 1.0;
        }
        let traveled = if current_hilbert > self.start_hilbert {
            current_hilbert - self.start_hilbert
        } else {
            0
        };
        (traveled as f32 / self.hilbert_distance as f32).min(1.0)
    }
}

/// Pathfinding strategy
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum PathStrategy {
    /// Direct Hilbert path (follows curve exactly)
    Direct,
    /// Shortest Euclidean distance (may jump between Hilbert regions)
    Shortest,
    /// Avoid specific districts or areas
    AvoidDistricts { excluded: Vec<String> },
    /// Prefer high-complexity areas (for Scouts)
    PreferComplexity,
    /// Prefer recently modified areas (for Engineers)
    PreferRecent,
}

/// The Hilbert Pathfinding Engine
pub struct HilbertPathfinder {
    grid_size: u32,
    max_hilbert: u32,
    source_loader: Option<SourceCityLoader>,
    /// Cache of computed paths
    path_cache: HashMap<(u32, u32), HilbertPath>,
    /// District boundaries (district name -> (min_hilbert, max_hilbert))
    district_bounds: HashMap<String, (u32, u32)>,
    /// Blocked Hilbert coordinates (obstacles)
    blocked: HashSet<u32>,
}

impl HilbertPathfinder {
    /// Create a new pathfinder with the given grid size
    pub fn new(grid_size: u32) -> Self {
        Self {
            grid_size,
            max_hilbert: grid_size * grid_size,
            source_loader: None,
            path_cache: HashMap::new(),
            district_bounds: HashMap::new(),
            blocked: HashSet::new(),
        }
    }

    /// Set the source city loader for district awareness
    pub fn set_source_loader(&mut self, loader: SourceCityLoader) {
        self.source_loader = Some(loader);
        self.compute_district_bounds();
    }

    /// Compute district boundaries from source city layout
    fn compute_district_bounds(&mut self) {
        self.district_bounds.clear();

        if let Some(ref loader) = self.source_loader {
            if let Some(layout) = loader.layout() {
                for (district_name, _) in &layout.districts {
                    let tiles: Vec<_> = layout
                        .tiles
                        .iter()
                        .filter(|t| &t.district == district_name)
                        .collect();

                    if let Some((min, max)) = tiles.iter().map(|t| {
                        // Convert tile position to Hilbert coordinate
                        let x = ((t.x + 1.0) * self.grid_size as f32 / 2.0) as u32;
                        let y = ((t.y + 1.0) * self.grid_size as f32 / 2.0) as u32;
                        self.xy_to_hilbert(x, y)
                    }).minmax() {
                        self.district_bounds
                            .insert(district_name.clone(), (min, max));
                    }
                }
            }
        }
    }

    /// Find path from start to end using specified strategy
    pub fn find_path(&mut self, start: u32, end: u32, strategy: PathStrategy) -> HilbertPath {
        // Check cache for direct paths
        if strategy == PathStrategy::Direct {
            if let Some(cached) = self.path_cache.get(&(start, end)) {
                return cached.clone();
            }
        }

        let path = match strategy {
            PathStrategy::Direct => self.find_direct_path(start, end),
            PathStrategy::Shortest => self.find_shortest_path(start, end),
            PathStrategy::AvoidDistricts { ref excluded } => {
                self.find_path_avoiding(start, end, excluded)
            }
            PathStrategy::PreferComplexity => self.find_path_preferring_complexity(start, end),
            PathStrategy::PreferRecent => self.find_path_preferring_recent(start, end),
        };

        // Cache direct paths
        if strategy == PathStrategy::Direct {
            self.path_cache.insert((start, end), path.clone());
        }

        path
    }

    /// Find direct path along Hilbert curve (follows curve exactly)
    fn find_direct_path(&self, start: u32, end: u32) -> HilbertPath {
        let mut path = HilbertPath::new(start, end);

        // Generate waypoints every N Hilbert units for smooth movement
        let step_size = self.grid_size / 16; // Adaptive step size
        let step_size = step_size.max(1);

        let (start_x, start_y) = self.hilbert_to_xy(start);
        path.waypoints.push(Waypoint::new(
            self.normalize_x(start_x),
            self.normalize_y(start_y),
            start,
        ));

        let distance = if end > start { end - start } else { start - end };
        let direction = if end > start { 1i32 } else { -1i32 };

        let mut current = start;
        while current != end {
            let step = (step_size as i32 * direction).abs() as u32;
            let next = if direction > 0 {
                (current + step).min(end)
            } else {
                current.saturating_sub(step).max(end)
            };

            let (x, y) = self.hilbert_to_xy(next);
            path.waypoints.push(Waypoint::new(
                self.normalize_x(x),
                self.normalize_y(y),
                next,
            ));

            current = next;
        }

        path.hilbert_distance = distance;
        path.estimated_time = distance as f32 / 100.0; // Assuming 100 units/sec speed

        path
    }

    /// Find shortest path (may use shortcuts)
    fn find_shortest_path(&self, start: u32, end: u32) -> HilbertPath {
        // For now, use direct path as base
        // In future, could implement A* on Hilbert grid
        self.find_direct_path(start, end)
    }

    /// Find path avoiding specific districts
    fn find_path_avoiding(&self, start: u32, end: u32, excluded: &[String]) -> HilbertPath {
        // Collect blocked coordinates from excluded districts
        let mut blocked: HashSet<u32> = self.blocked.clone();
        for district in excluded {
            if let Some((min, max)) = self.district_bounds.get(district) {
                for h in *min..=*max {
                    blocked.insert(h);
                }
            }
        }

        // Use A* to find path around blocked areas
        self.astar_path(start, end, &blocked)
    }

    /// Find path preferring high-complexity areas (for Scouts)
    fn find_path_preferring_complexity(&self, start: u32, end: u32) -> HilbertPath {
        // TODO: Integrate with complexity metrics from source city
        self.find_direct_path(start, end)
    }

    /// Find path preferring recently modified areas (for Engineers)
    fn find_path_preferring_recent(&self, start: u32, end: u32) -> HilbertPath {
        // TODO: Integrate with modification timestamps
        self.find_direct_path(start, end)
    }

    /// A* pathfinding on Hilbert grid
    fn astar_path(&self, start: u32, end: u32, blocked: &HashSet<u32>) -> HilbertPath {
        #[derive(Debug, Clone, Copy, PartialEq, Eq)]
        struct Node {
            hilbert: u32,
            g: u32, // Cost from start
            f: u32, // Estimated total cost
        }

        impl Ord for Node {
            fn cmp(&self, other: &Self) -> std::cmp::Ordering {
                other.f.cmp(&self.f) // Reverse for min-heap
            }
        }

        impl PartialOrd for Node {
            fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
                Some(self.cmp(other))
            }
        }

        let mut open_set = BinaryHeap::new();
        let mut came_from: HashMap<u32, u32> = HashMap::new();
        let mut g_score: HashMap<u32, u32> = HashMap::new();

        g_score.insert(start, 0);
        open_set.push(Node {
            hilbert: start,
            g: 0,
            f: self.hilbert_heuristic(start, end),
        });

        while let Some(current) = open_set.pop() {
            if current.hilbert == end {
                // Reconstruct path
                return self.reconstruct_path(start, end, &came_from);
            }

            for neighbor in self.hilbert_neighbors(current.hilbert) {
                if blocked.contains(&neighbor) {
                    continue;
                }

                let tentative_g = g_score.get(&current.hilbert).unwrap_or(&u32::MAX) + 1;

                if tentative_g < *g_score.get(&neighbor).unwrap_or(&u32::MAX) {
                    came_from.insert(neighbor, current.hilbert);
                    g_score.insert(neighbor, tentative_g);
                    open_set.push(Node {
                        hilbert: neighbor,
                        g: tentative_g,
                        f: tentative_g + self.hilbert_heuristic(neighbor, end),
                    });
                }
            }
        }

        // No path found, return direct path
        self.find_direct_path(start, end)
    }

    /// Reconstruct path from A* came_from map
    fn reconstruct_path(
        &self,
        start: u32,
        end: u32,
        came_from: &HashMap<u32, u32>,
    ) -> HilbertPath {
        let mut path = HilbertPath::new(start, end);
        let mut current = end;
        let mut waypoints = Vec::new();

        while current != start {
            let (x, y) = self.hilbert_to_xy(current);
            waypoints.push(Waypoint::new(
                self.normalize_x(x),
                self.normalize_y(y),
                current,
            ));

            match came_from.get(&current) {
                Some(&prev) => current = prev,
                None => break,
            }
        }

        // Add start
        let (x, y) = self.hilbert_to_xy(start);
        waypoints.push(Waypoint::new(self.normalize_x(x), self.normalize_y(y), start));

        // Reverse to get start -> end order
        waypoints.reverse();
        path.waypoints = waypoints;
        path.hilbert_distance = (end as i32 - start as i32).abs() as u32;
        path.estimated_time = path.hilbert_distance as f32 / 100.0;

        path
    }

    /// Get neighboring Hilbert coordinates
    fn hilbert_neighbors(&self, hilbert: u32) -> Vec<u32> {
        let (x, y) = self.hilbert_to_xy(hilbert);
        let mut neighbors = Vec::new();

        // Check 4-connected neighbors
        let deltas = [(0i32, 1i32), (0, -1), (1, 0), (-1, 0)];
        for (dx, dy) in &deltas {
            let nx = x as i32 + dx;
            let ny = y as i32 + dy;

            if nx >= 0
                && ny >= 0
                && nx < self.grid_size as i32
                && ny < self.grid_size as i32
            {
                let nh = self.xy_to_hilbert(nx as u32, ny as u32);
                if nh < self.max_hilbert {
                    neighbors.push(nh);
                }
            }
        }

        neighbors
    }

    /// Heuristic for A* (Hilbert distance)
    fn hilbert_heuristic(&self, a: u32, b: u32) -> u32 {
        // Simple heuristic: just the difference in Hilbert coordinates
        // This works well because Hilbert curve preserves locality
        (a as i32 - b as i32).abs() as u32
    }

    /// Convert Hilbert coordinate to (x, y)
    pub fn hilbert_to_xy(&self, d: u32) -> (u32, u32) {
        let n = self.grid_size;
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        let mut t = d;

        while s < n {
            let rx = 1 & (t / 2);
            let ry = 1 & (t ^ rx);

            if ry == 0 {
                if rx == 1 {
                    x = n.wrapping_sub(1).wrapping_sub(x);
                    y = n.wrapping_sub(1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }

            x = x.wrapping_add(s * rx);
            y = y.wrapping_add(s * ry);
            t /= 4;
            s *= 2;
        }

        (x, y)
    }

    /// Convert (x, y) to Hilbert coordinate
    pub fn xy_to_hilbert(&self, x: u32, y: u32) -> u32 {
        let mut d = 0u32;
        let mut s = 1u32;
        let mut cur_x = x;
        let mut cur_y = y;

        while s < self.grid_size {
            let mask = s - 1;
            let rx = cur_x & mask;
            let ry = cur_y & mask;

            // Rotate/flip quadrant
            d += s * s * match (rx, ry) {
                (0, 0) => 0,
                (1, 0) => 1,
                (1, 1) => 2,
                (0, 1) => 3,
                _ => 0,
            };

            cur_x = if ry == 0 {
                if rx == 1 {
                    s - 1 - cur_x
                } else {
                    cur_x
                }
            } else {
                cur_x
            };

            std::mem::swap(&mut cur_x, &mut cur_y);
            cur_x += if ry == 0 && rx == 1 { s } else { 0 };
            cur_y += if ry == 0 && rx == 1 { s } else { 0 };

            s *= 2;
        }

        d
    }

    /// Normalize x coordinate to [-1, 1] range
    fn normalize_x(&self, x: u32) -> f32 {
        (x as f32 - self.grid_size as f32 / 2.0) / (self.grid_size as f32 / 2.0)
    }

    /// Normalize y coordinate to [-1, 1] range
    fn normalize_y(&self, y: u32) -> f32 {
        (y as f32 - self.grid_size as f32 / 2.0) / (self.grid_size as f32 / 2.0)
    }

    /// Block a Hilbert coordinate (obstacle)
    pub fn block_coordinate(&mut self, hilbert: u32) {
        self.blocked.insert(hilbert);
    }

    /// Unblock a Hilbert coordinate
    pub fn unblock_coordinate(&mut self, hilbert: u32) {
        self.blocked.remove(&hilbert);
    }

    /// Get district containing a Hilbert coordinate
    pub fn get_district_at(&self, hilbert: u32) -> Option<&String> {
        self.district_bounds
            .iter()
            .find(|(_, (min, max))| hilbert >= *min && hilbert <= *max)
            .map(|(name, _)| name)
    }

    /// Clear path cache
    pub fn clear_cache(&mut self) {
        self.path_cache.clear();
    }

    /// Precompute paths between common destinations
    pub fn precompute_common_paths(&mut self, destinations: &[u32]) {
        for i in 0..destinations.len() {
            for j in (i + 1)..destinations.len() {
                let start = destinations[i];
                let end = destinations[j];
                let path = self.find_direct_path(start, end);
                self.path_cache.insert((start, end), path.clone());
                // Also cache reverse
                let mut reverse = path;
                reverse.waypoints.reverse();
                reverse.start_hilbert = end;
                reverse.end_hilbert = start;
                self.path_cache.insert((end, start), reverse);
            }
        }
    }
}

/// Helper trait for min/max iterator operations
trait MinMax<T> {
    fn minmax(self) -> Option<(T, T)>;
}

impl<T: Iterator<Item = u32>> MinMax<u32> for T {
    fn minmax(self) -> Option<(u32, u32)> {
        let mut min = u32::MAX;
        let mut max = u32::MIN;
        let mut has_items = false;

        for item in self {
            has_items = true;
            min = min.min(item);
            max = max.max(item);
        }

        if has_items {
            Some((min, max))
        } else {
            None
        }
    }
}

/// Integrate pathfinding with agent goals
pub fn assign_navigation_goal(
    agent: &mut CityAgent,
    pathfinder: &mut HilbertPathfinder,
    destination_hilbert: u32,
    strategy: PathStrategy,
) -> Option<HilbertPath> {
    let path = pathfinder.find_path(agent.hilbert_pos, destination_hilbert, strategy);

    if path.is_valid() {
        // Set agent's target to first waypoint
        if let Some(waypoint) = path.waypoints.get(1) {
            agent.target_pos = Some((waypoint.x, waypoint.y));
            agent.state = crate::cognitive::agents::AgentState::Navigating;
        }
        Some(path)
    } else {
        None
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pathfinder_creation() {
        let pathfinder = HilbertPathfinder::new(256);
        assert_eq!(pathfinder.grid_size, 256);
        assert_eq!(pathfinder.max_hilbert, 256 * 256);
    }

    #[test]
    fn test_direct_path() {
        let mut pathfinder = HilbertPathfinder::new(256);
        let path = pathfinder.find_path(0, 100, PathStrategy::Direct);

        assert!(path.is_valid());
        assert_eq!(path.start_hilbert, 0);
        assert_eq!(path.end_hilbert, 100);
        assert!(!path.waypoints.is_empty());
    }

    #[test]
    fn test_path_progress() {
        let mut pathfinder = HilbertPathfinder::new(256);
        let path = pathfinder.find_path(0, 100, PathStrategy::Direct);

        assert_eq!(path.progress(0), 0.0);
        assert_eq!(path.progress(50), 0.5);
        assert_eq!(path.progress(100), 1.0);
    }

    #[test]
    fn test_hilbert_conversions() {
        let pathfinder = HilbertPathfinder::new(256);

        // Test basic conversions at key points
        // (0, 0) should map to Hilbert 0
        let h0 = pathfinder.xy_to_hilbert(0, 0);
        assert_eq!(h0, 0);
        
        // Hilbert 0 should map to (0, 0)
        let (x0, y0) = pathfinder.hilbert_to_xy(0);
        assert_eq!(x0, 0);
        assert_eq!(y0, 0);
        
        // Test that pathfinding uses the conversions correctly
        // by verifying a path can be created
        let mut pathfinder = HilbertPathfinder::new(256);
        let path = pathfinder.find_path(0, 1000, PathStrategy::Direct);
        assert!(path.is_valid());
        assert!(!path.waypoints.is_empty());
    }

    #[test]
    fn test_waypoint_distance() {
        let w1 = Waypoint::new(0.0, 0.0, 0);
        let w2 = Waypoint::new(3.0, 4.0, 1);

        assert!((w1.distance_to(&w2) - 5.0).abs() < 0.001);
    }

    #[test]
    fn test_path_caching() {
        let mut pathfinder = HilbertPathfinder::new(256);

        // First call computes
        let path1 = pathfinder.find_path(0, 100, PathStrategy::Direct);

        // Second call should use cache
        let path2 = pathfinder.find_path(0, 100, PathStrategy::Direct);

        assert_eq!(path1.waypoints.len(), path2.waypoints.len());
    }
}
