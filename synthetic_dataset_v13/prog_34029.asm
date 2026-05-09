; DESCRIPTION: Draws a purple rectangle at (184, 33) with width 106 and height 74.
; PLAN: r0=184(x), r1=33(y), r2=106(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 33
LDI r2, 106
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
