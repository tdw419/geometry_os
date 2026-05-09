; DESCRIPTION: Composite: Sets a single blue pixel at (30, 248) then Draws a purple rectangle at (146, 7) with width 32 and height 118.
; PLAN: r0=30(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=7(y), r7=32(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 7
LDI r7, 32
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
