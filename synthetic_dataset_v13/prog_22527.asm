; DESCRIPTION: Composite: Sets a single orange pixel at (279, 188) then Places a blue 83x96 rectangle at position (195, 73).
; PLAN: r0=279(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=73(y), r7=83(width), r8=96(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 195
LDI r6, 73
LDI r7, 83
LDI r8, 96
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
