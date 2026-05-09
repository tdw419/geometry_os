; DESCRIPTION: Draws a purple rectangle at (282, 85) with width 106 and height 33.
; PLAN: r0=282(x), r1=85(y), r2=106(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 85
LDI r2, 106
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
