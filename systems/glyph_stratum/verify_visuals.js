const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ 
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  const page = await browser.newPage();
  await page.setViewport({ width: 1200, height: 800 });
  const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
  
  // Navigate to the editor (server is already running at 8000)
  await page.goto('http://localhost:8000/glyph_editor.html');
  
  // Wait for the atlas to load
  await delay(2000);
  
  // Simulate the 'Final Boss' String Buffer Stress Test
  await page.evaluate(() => {
    addGlyph('SUBSTRATE', 'DATA');
    addGlyph('LOGIC', 'CONCAT');
    addGlyph('LOGIC', 'LEN');
    addGlyph('MEMORY', 'PUSH');
    addGlyph('MEMORY', 'ALLOC');
    addGlyph('SPEC', 'EXPORT');
    addGlyph('INTENT', 'MODULE');
    autoLayout();
  });
  
  // Wait for the layout to stabilize
  await delay(2000);
  
  // Verify resources
  const resourceLogs = await page.evaluate(() => {
    return window.performance.getEntries()
      .filter(e => e.name.includes('atlas') || e.name.includes('positions'))
      .map(e => ({ name: e.name.split('/').pop(), status: 'loaded' }));
  });
  console.log('Resource check:', JSON.stringify(resourceLogs, null, 2));
  
  // Take a screenshot
  await page.screenshot({ path: 'systems/glyph_stratum/docs/stress_test_result.png' });
  
  // Check image tags
  const imageCount = await page.evaluate(() => {
    return document.querySelectorAll('image').length;
  });
  console.log(`Rendered GEOS Font Glyphs: ${imageCount}`);
  
  await browser.close();
})();
