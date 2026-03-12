const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ 
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  const page = await browser.newPage();
  await page.setViewport({ width: 1200, height: 800 });
  
  // Navigate to the editor (server is already running at 8000)
  await page.goto('http://localhost:8000/glyph_editor.html');
  
  // Wait for the atlas to load (it logs to console)
  const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
  await delay(2000);
  
  // Simulate the 'Final Boss' String Buffer Stress Test by adding opcodes via the API
  // We'll use the browser console to call the editor's addGlyph function
  await page.evaluate(() => {
    // Adding the String Buffer nodes
    addGlyph('SUBSTRATE', 'DATA');
    addGlyph('LOGIC', 'CONCAT');
    addGlyph('LOGIC', 'LEN');
    addGlyph('MEMORY', 'PUSH');
    addGlyph('MEMORY', 'ALLOC');
    addGlyph('SPEC', 'EXPORT');
    addGlyph('INTENT', 'MODULE');
    
    // Auto-layout to separate them
    autoLayout();
  });
  
  // Wait for the layout to stabilize
  const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
  await delay(2000);
  
  // Check if any errors were logged during atlas loading
  const logs = await page.evaluate(() => {
    return window.performance.getEntries().filter(e => e.name.includes('atlas') || e.name.includes('positions'));
  });
  console.log('Resource logs:', JSON.stringify(logs, null, 2));
  
  // Take a screenshot of the result
  await page.screenshot({ path: 'systems/glyph_stratum/docs/stress_test_result.png' });
  
  // Check the DOM to see if the <image> tags exist (verifying atlas integration)
  const imageCount = await page.evaluate(() => {
    return document.querySelectorAll('image').length;
  });
  console.log(`Rendered <image> tags (atlas): ${imageCount}`);
  
  await browser.close();
})();
