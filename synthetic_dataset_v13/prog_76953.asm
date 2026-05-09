; DESCRIPTION: Composite: Places a yellow 70x95 rectangle at position (71, 73) then Draws a purple circle centered at (420, 147) with radius 49.
; PLAN: r0=71(x), r1=73(y), r2=70(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=147(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 73
LDI r2, 70
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 147
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
