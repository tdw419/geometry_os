; DESCRIPTION: Composite: Sets a single blue pixel at (95, 109) then Draws a purple rectangle at (143, 97) with width 35 and height 50.
; PLAN: r0=95(x), r1=109(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=143(x), r6=97(y), r7=35(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 109
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 143
LDI r6, 97
LDI r7, 35
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
