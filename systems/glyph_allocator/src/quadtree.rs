//! systems/glyph_allocator/src/quadtree.rs
//!
//! Hierarchical spatial partitioning for 2D memory allocation.
//! Recursive subdivision of the pixel grid into quadrants.

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum NodeState {
    Free,
    Full,
    Partial,
}

#[derive(Debug, Clone)]
pub struct QuadNode {
    pub x: u32,
    pub y: u32,
    pub size: u32,
    pub state: NodeState,
    pub children: Option<Box<[QuadNode; 4]>>,
    pub glyph_id: Option<u32>,
}

impl QuadNode {
    pub fn new(x: u32, y: u32, size: u32) -> Self {
        Self {
            x,
            y,
            size,
            state: NodeState::Free,
            children: None,
            glyph_id: None,
        }
    }

    /// Recursively find and allocate a region of a given size
    pub fn allocate(&mut self, glyph_id: u32, req_size: u32) -> Option<(u32, u32)> {
        if self.state == NodeState::Full {
            return None;
        }

        // If this node is the exact size or smaller than we can split, try to take it
        if self.size == req_size && self.state == NodeState::Free {
            self.state = NodeState::Full;
            self.glyph_id = Some(glyph_id);
            return Some((self.x, self.y));
        }

        // If the node is larger than requested, split it if it hasn't been already
        if self.size > req_size {
            if self.children.is_none() {
                let half = self.size / 2;
                self.children = Some(Box::new([
                    QuadNode::new(self.x, self.y, half),              // Top-Left
                    QuadNode::new(self.x + half, self.y, half),       // Top-Right
                    QuadNode::new(self.x, self.y + half, half),       // Bottom-Left
                    QuadNode::new(self.x + half, self.y + half, half), // Bottom-Right
                ]));
            }

            // Try to allocate in children
            if let Some(ref mut children) = self.children {
                for child in children.iter_mut() {
                    if let Some(coords) = child.allocate(glyph_id, req_size) {
                        self.update_state();
                        return Some(coords);
                    }
                }
            }
        }

        None
    }

    /// Recursively free a glyph by ID
    pub fn free(&mut self, glyph_id: u32) -> bool {
        if self.glyph_id == Some(glyph_id) {
            self.state = NodeState::Free;
            self.glyph_id = None;
            self.children = None; // Collapse children if any
            return true;
        }

        let mut freed = false;
        if let Some(ref mut children) = self.children {
            for child in children.iter_mut() {
                if child.free(glyph_id) {
                    freed = true;
                    break;
                }
            }
        }

        if freed {
            self.update_state();
            // Optional: Coalesce children if all are free
            if self.state == NodeState::Free {
                self.children = None;
            }
        }

        freed
    }

    /// Update node state based on children
    fn update_state(&mut self) {
        if let Some(ref children) = self.children {
            let mut all_full = true;
            let mut all_free = true;

            for child in children.iter() {
                match child.state {
                    NodeState::Full => all_free = false,
                    NodeState::Free => all_full = false,
                    NodeState::Partial => {
                        all_full = false;
                        all_free = false;
                    }
                }
            }

            if all_full {
                self.state = NodeState::Full;
            } else if all_free {
                self.state = NodeState::Free;
            } else {
                self.state = NodeState::Partial;
            }
        }
    }

    /// Calculate total utilization in this branch
    pub fn utilization(&self) -> u64 {
        match self.state {
            NodeState::Full => (self.size as u64) * (self.size as u64),
            NodeState::Free => 0,
            NodeState::Partial => {
                if let Some(ref children) = self.children {
                    children.iter().map(|c| c.utilization()).sum()
                } else {
                    0
                }
            }
        }
    }
}
