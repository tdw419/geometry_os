; DESCRIPTION: Draws a purple rectangle at (166, 25) with width 17 and height 88.
; PLAN: r0=166(x), r1=25(y), r2=17(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 25
LDI r2, 17
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
