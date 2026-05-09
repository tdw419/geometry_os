; DESCRIPTION: Composite: Sets a single red pixel at (163, 181) then Draws a purple rectangle at (86, 183) with width 87 and height 69.
; PLAN: r0=163(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=183(y), r7=87(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 86
LDI r6, 183
LDI r7, 87
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
