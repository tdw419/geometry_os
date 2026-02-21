// src/memory_graph.rs
// Memory Graph Data Structures
// Neural memory graph representation for real-time visualization
//
// This module defines the core data structures for representing neural memory graphs,
// including nodes, edges, and graph metadata with serialization support for protocol
// communication.

use std::collections::HashMap;
use serde::{Deserialize, Serialize};
use serde_json::Value;

/// Type of neural memory node
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq)]
pub enum NodeType {
    /// Neural processing unit
    Neuron,
    /// Connection synapse
    Synapse,
    /// Memory storage unit
    Memory,
    /// Input receptor
    Input,
    /// Output effector
    Output,
}

/// Neural memory node representation
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryNode {
    /// Unique node identifier
    pub id: String,
    /// Type of neural node
    pub node_type: NodeType,
    /// 3D position in graph space
    pub position: [f32; 3],
    /// Current activation level (0.0 to 1.0)
    pub activation: f32,
    /// Connected node IDs for adjacency
    pub connections: Vec<String>,
    /// Additional metadata as key-value pairs
    pub metadata: HashMap<String, Value>,
}

/// Memory graph edge representing connection between nodes
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryEdge {
    /// Source node ID
    pub from: String,
    /// Target node ID
    pub to: String,
    /// Connection strength/weight
    pub weight: f32,
    /// Additional edge metadata
    pub metadata: HashMap<String, Value>,
}

/// Graph-level metadata
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GraphMetadata {
    /// Graph format version
    pub version: String,
    /// Total number of nodes
    pub total_nodes: usize,
    /// Total number of edges
    pub total_edges: usize,
    /// Creation timestamp (Unix epoch)
    pub created_at: u64,
    /// Additional graph properties
    pub properties: HashMap<String, Value>,
}

/// Memory graph containing nodes and edges
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryGraph {
    /// Node storage keyed by ID
    pub nodes: HashMap<String, MemoryNode>,
    /// Edge list
    pub edges: Vec<MemoryEdge>,
    /// Last update timestamp (Unix epoch)
    pub timestamp: u64,
    /// Graph metadata
    pub graph_metadata: GraphMetadata,
}

impl MemoryGraph {
    /// Create a new empty memory graph
    pub fn new() -> Self {
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();

        Self {
            nodes: HashMap::new(),
            edges: Vec::new(),
            timestamp: now,
            graph_metadata: GraphMetadata {
                version: "1.0".to_string(),
                total_nodes: 0,
                total_edges: 0,
                created_at: now,
                properties: HashMap::new(),
            },
        }
    }

    /// Add a node to the graph
    pub fn add_node(&mut self, node: MemoryNode) {
        self.nodes.insert(node.id.clone(), node);
        self.graph_metadata.total_nodes = self.nodes.len();
        self.update_timestamp();
    }

    /// Add an edge to the graph
    pub fn add_edge(&mut self, edge: MemoryEdge) {
        self.edges.push(edge);
        self.graph_metadata.total_edges = self.edges.len();
        self.update_timestamp();
    }

    /// Get a node by ID
    pub fn get_node(&self, id: &str) -> Option<&MemoryNode> {
        self.nodes.get(id)
    }

    /// Get a mutable reference to a node by ID
    pub fn get_node_mut(&mut self, id: &str) -> Option<&mut MemoryNode> {
        self.nodes.get_mut(id)
    }

    /// Update the graph timestamp to current time
    pub fn update_timestamp(&mut self) {
        self.timestamp = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();
    }

    /// Get all edges connected to a node
    pub fn get_node_edges(&self, node_id: &str) -> Vec<&MemoryEdge> {
        self.edges
            .iter()
            .filter(|edge| edge.from == node_id || edge.to == node_id)
            .collect()
    }

    /// Get outgoing edges from a node
    pub fn get_outgoing_edges(&self, node_id: &str) -> Vec<&MemoryEdge> {
        self.edges
            .iter()
            .filter(|edge| edge.from == node_id)
            .collect()
    }

    /// Get incoming edges to a node
    pub fn get_incoming_edges(&self, node_id: &str) -> Vec<&MemoryEdge> {
        self.edges
            .iter()
            .filter(|edge| edge.to == node_id)
            .collect()
    }
}

impl Default for MemoryGraph {
    fn default() -> Self {
        Self::new()
    }
}