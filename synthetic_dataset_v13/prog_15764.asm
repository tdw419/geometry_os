; DESCRIPTION: Composite: Places a magenta 103x29 rectangle at position (106, 54) then Sets a single purple pixel at (471, 245).
; PLAN: r0=106(x), r1=54(y), r2=103(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x), r6=245(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 54
LDI r2, 103
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 245
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
