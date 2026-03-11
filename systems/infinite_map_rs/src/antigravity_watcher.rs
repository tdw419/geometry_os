use notify::{Watcher, RecursiveMode, RecommendedWatcher, Event, Config};
use std::path::PathBuf;
use std::sync::{Arc, Mutex};
use std::time::Duration;
use crossbeam_channel::{unbounded, Receiver, Sender};
use image::GenericImageView;

pub struct AntigravityWatcher {
    #[allow(dead_code)]
    watcher: RecommendedWatcher,
    // The latest frame ready for consumption. 
    // Arc/Mutex so the loader thread can write and main thread can read.
    // Data, Width, Height, Metadata(JSON)
    latest_frame: Arc<Mutex<Option<(Vec<u8>, u32, u32, String)>>>,
    path: PathBuf,
}

impl AntigravityWatcher {
    pub fn new(path: PathBuf) -> Self {
        let latest_frame = Arc::new(Mutex::new(None));
        let frame_writer = latest_frame.clone();
        let path_clone = path.clone();

        // Channel to bridge Notify (sync/callback) -> Loader Thread
        let (tx, rx) = unbounded();

        // Watcher setup
        // We watch the PARENT directory to handle "atomic rename" (write-replace) patterns reliably.
        // watching the file directly on Linux (inotify) can fail if the inode is replaced.
        let parent = path.parent().unwrap_or(&path).to_path_buf();
        let target_filename = path.file_name().map(|s| s.to_os_string());

        let tx_watcher = tx.clone();
        let mut watcher = notify::recommended_watcher(move |res: Result<Event, notify::Error>| {
            if let Ok(event) = res {
                // Filter: Only trigger if the event involves our target file
                let relevant = if let Some(ref target) = target_filename {
                    event.paths.iter().any(|p| p.file_name() == Some(target))
                } else {
                    true // Should not happen if path is valid
                };

                if relevant {
                    let _ = tx_watcher.send(()); 
                }
            }
        }).expect("Failed to create watcher");

        // Watch the directory
        if let Err(e) = watcher.watch(&parent, RecursiveMode::NonRecursive) {
            eprintln!("warn: AntigravityWatcher failed to watch parent directory {:?}: {}", parent, e);
        }

        // Spawn Loader Thread (Debouncer & Loader)
        std::thread::spawn(move || {
            // Initial load (just in case)
            let _ = tx.send(());

            eprintln!("debug: AntigravityWatcher thread started for {:?}", path_clone);
            loop {
                // Wait for an event
                if rx.recv().is_err() { break; } // Channel closed (Watcher dropped)

                // Debounce: Wait 100ms for file settle (increased from 50ms)
                std::thread::sleep(Duration::from_millis(100));
                
                // Drain pending events
                while let Ok(_) = rx.try_recv() {} 
                
                // Load
                // Retry loop for atomicity race conditions
                let mut success = false;
                for _ in 0..5 {
                    if let Ok(img) = image::open(&path_clone) {
                        let width = img.width();
                        let height = img.height();
                        let data = img.to_rgba8().into_raw();
                        
                        let mut metadata_str = String::from("{}");
                        
                        // Separate pass for metadata using 'png' crate (low level)
                        if let Ok(file) = std::fs::File::open(&path_clone) {
                            let decoder = png::Decoder::new(file);
                            if let Ok(reader) = decoder.read_info() {
                                // Extract textual metadata
                                for text_chunk in &reader.info().uncompressed_latin1_text {
                                    if text_chunk.keyword == "pixelrts_meta" {
                                        metadata_str = text_chunk.text.clone();
                                        eprintln!("debug: Found embedded logic: {:.50}...", metadata_str);
                                        break;
                                    }
                                }
                            }
                        }

                        let mut lock = frame_writer.lock().unwrap();
                        *lock = Some((data, width, height, metadata_str));
                        eprintln!("debug: AntigravityWatcher loaded new frame ({}x{})", width, height);
                        success = true;
                        break;
                    } 
                    // Wait a bit if failed (maybe mid-write?)
                    std::thread::sleep(Duration::from_millis(20));
                }
                
                if !success {
                    // Start quiet, only warn if persistent
                    // eprintln!("warn: AntigravityWatcher failed to open {:?} after retries", path_clone);
                }
            }
        });

        Self {
            watcher,
            latest_frame,
            path,
        }
    }

    /// Non-blocking check for new data.
    /// Consumes the data if available (returns Some only once per update).
    pub fn check_and_load(&self) -> Option<(Vec<u8>, u32, u32, String)> {
        let mut lock = self.latest_frame.lock().unwrap();
        lock.take()
    }
}
