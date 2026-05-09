; DESCRIPTION: Composite: Sets a single orange pixel at (296, 183) then Places a magenta 120x30 rectangle at position (284, 179).
; PLAN: r0=296(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=179(y), r7=120(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 284
LDI r6, 179
LDI r7, 120
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
