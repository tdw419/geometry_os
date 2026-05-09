; DESCRIPTION: Draws a purple rectangle at (4, 76) with width 17 and height 49.
; PLAN: r0=4(x), r1=76(y), r2=17(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 76
LDI r2, 17
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
