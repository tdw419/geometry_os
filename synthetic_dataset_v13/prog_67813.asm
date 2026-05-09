; DESCRIPTION: Composite: Draws a orange rectangle at (73, 126) with width 51 and height 58 then Draws a purple circle centered at (415, 74) with radius 68.
; PLAN: r0=73(x), r1=126(y), r2=51(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=74(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 73
LDI r1, 126
LDI r2, 51
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 74
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
