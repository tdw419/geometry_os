; DESCRIPTION: Composite: Draws a purple rectangle at (250, 232) with width 109 and height 14 then Draws a magenta circle centered at (180, 140) with radius 16.
; PLAN: r0=250(x), r1=232(y), r2=109(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=140(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 232
LDI r2, 109
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 140
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
