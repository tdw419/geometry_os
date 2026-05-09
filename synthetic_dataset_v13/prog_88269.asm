; DESCRIPTION: Composite: Sets a single red pixel at (429, 178) then Renders a white box of size 111x25 starting at (332, 42).
; PLAN: r0=429(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=42(y), r7=111(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 42
LDI r7, 111
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
