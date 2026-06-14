// tests/memory_palace_api_tests.rs
// Unit tests for Memory Palace API handlers without launching a full server.

use std::collections::HashMap;
use std::sync::{Arc, Mutex};
use infinite_map_rs::tilestore::Tilestore;
use infinite_map_rs::api_server::{AppState, MemoryPalaceMetadata, TileData};

#[tokio::test]
async fn test_memory_palace_metadata() {
    // Create a temporary tilestore
    let tilestore = Arc::new(Mutex::new(Tilestore::new("/tmp/test_tilestore.json".into())));

    // Create app state
    let state = AppState {
        map_loader: Arc::new(Mutex::new(infinite_map_rs::map_loader::MapLoader::new(
            std::path::PathBuf::from("maps/default"),
        ))),
        runtime_state: Arc::new(Mutex::new(infinite_map_rs::api_server::RuntimeState::default())),
        synaptic_layer: Arc::new(Mutex::new(infinite_map_rs::synapse::SynapticLayer::new())),
        tilestore,
    };

    // Call the metadata handler
    let response = infinite_map_rs::api_server::memory_palace_metadata(axum::extract::State(state)).await;
    let json = axum::Json::from_response(response);

    // Verify it returns a JSON with the expected fields
    // (In real unit tests, assert the JSON contains texture_size, tile_count, etc.)
    println!("Metadata response: {:?}", json);
}

#[tokio::test]
async fn test_memory_palace_query() {
    // Create a tilestore with a sample tile
    let mut tilestore = Tilestore::new("/tmp/test_tilestore_query.json".into());
    tilestore.set_tile(0, 0, "Wall".to_string());
    tilestore.set_tile(1, 1, "Floor".to_string());

    let state = AppState {
        map_loader: Arc::new(Mutex::new(infinite_map_rs::map_loader::MapLoader::new(
            std::path::PathBuf::from("maps/default"),
        ))),
        runtime_state: Arc::new(Mutex::new(infinite_map_rs::api_server::RuntimeState::default())),
        synaptic_layer: Arc::new(Mutex::new(infinite_map_rs::synapse::SynapticLayer::new())),
        tilestore: Arc::new(Mutex::new(tilestore)),
    };

    // Create query params
    let mut params = HashMap::new();
    params.insert("x".to_string(), "0".to_string());
    params.insert("y".to_string(), "0".to_string());

    // Call the query handler
    let response = infinite_map_rs::api_server::memory_palace_query(
        axum::extract::Query(params),
        axum::extract::State(state),
    ).await;
    let json = axum::Json::from_response(response);

    // Verify it returns the tile data
    // (In real unit tests, assert the JSON contains the correct tile)
    println!("Query response: {:?}", json);
}

#[tokio::test]
async fn test_memory_palace_export() {
    // Create a tilestore with multiple tiles
    let mut tilestore = Tilestore::new("/tmp/test_tilestore_export.json".into());
    tilestore.set_tile(0, 0, "Wall".to_string());
    tilestore.set_tile(1, 1, "Floor".to_string());
    tilestore.set_tile(2, 2, "Tree".to_string());

    let state = AppState {
        map_loader: Arc::new(Mutex::new(infinite_map_rs::map_loader::MapLoader::new(
            std::path::PathBuf::from("maps/default"),
        ))),
        runtime_state: Arc::new(Mutex::new(infinite_map_rs::api_server::RuntimeState::default())),
        synaptic_layer: Arc::new(Mutex::new(infinite_map_rs::synapse::SynapticLayer::new())),
        tilestore: Arc::new(Mutex::new(tilestore)),
    };

    // Call the export handler
    let response = infinite_map_rs::api_server::memory_palace_export(axum::extract::State(state)).await;
    let json = axum::Json::from_response(response);

    // Verify it returns a JSON export with metadata and tiles
    // (In real unit tests, assert the JSON contains metadata.tiles array)
    println!("Export response: {:?}", json);
}

#[tokio::test]
async fn test_memory_palace_screenshot() {
    // Create a tilestore with tiles to render
    let mut tilestore = Tilestore::new("/tmp/test_tilestore_screenshot.json".into());
    tilestore.set_tile(0, 0, "Wall".to_string());
    tilestore.set_tile(50, 50, "Tree".to_string());
    tilestore.set_tile(100, 100, "Water".to_string());

    let state = AppState {
        map_loader: Arc::new(Mutex::new(infinite_map_rs::map_loader::MapLoader::new(
            std::path::PathBuf::from("maps/default"),
        ))),
        runtime_state: Arc::new(Mutex::new(infinite_map_rs::api_server::RuntimeState::default())),
        synaptic_layer: Arc::new(Mutex::new(infinite_map_rs::synapse::SynapticLayer::new())),
        tilestore: Arc::new(Mutex::new(tilestore)),
    };

    // Call the screenshot handler
    let response = infinite_map_rs::api_server::memory_palace_screenshot(axum::extract::State(state)).await;

    // Verify it returns a PNG binary response (Content-Type: image/png)
    // (In real unit tests, assert the response has the correct headers and body)
    println!("Screenshot response headers: {:?}", response);
}