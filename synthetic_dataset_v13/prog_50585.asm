; DESCRIPTION: Draws a purple rectangle at (163, 141) with width 88 and height 17.
; PLAN: r0=163(x), r1=141(y), r2=88(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 141
LDI r2, 88
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
