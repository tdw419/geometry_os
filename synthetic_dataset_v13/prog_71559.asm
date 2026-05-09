; DESCRIPTION: Draws a purple rectangle at (282, 20) with width 107 and height 88.
; PLAN: r0=282(x), r1=20(y), r2=107(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 20
LDI r2, 107
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
