; DESCRIPTION: Draws a purple rectangle at (407, 17) with width 84 and height 105.
; PLAN: r0=407(x), r1=17(y), r2=84(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 17
LDI r2, 84
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
