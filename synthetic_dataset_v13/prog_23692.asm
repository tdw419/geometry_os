; DESCRIPTION: Composite: Draws a purple rectangle at (325, 88) with width 96 and height 36 then Draws a yellow circle centered at (240, 70) with radius 70.
; PLAN: r0=325(x), r1=88(y), r2=96(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=70(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 88
LDI r2, 96
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 70
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
