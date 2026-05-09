; DESCRIPTION: Composite: Sets a single red pixel at (476, 158) then Draws a black rectangle at (192, 37) with width 74 and height 98.
; PLAN: r0=476(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=37(y), r7=74(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 192
LDI r6, 37
LDI r7, 74
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
