; DESCRIPTION: Composite: Sets a single white pixel at (247, 38) then Places a magenta 106x58 rectangle at position (90, 183).
; PLAN: r0=247(x), r1=38(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=183(y), r7=106(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 38
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 183
LDI r7, 106
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
