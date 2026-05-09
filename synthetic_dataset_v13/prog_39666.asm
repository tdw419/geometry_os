; DESCRIPTION: Composite: Draws a magenta rectangle at (378, 83) with width 71 and height 79 then Renders a purple disk with center (260, 121) and radius 49.
; PLAN: r0=378(x), r1=83(y), r2=71(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=121(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 83
LDI r2, 71
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 121
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
