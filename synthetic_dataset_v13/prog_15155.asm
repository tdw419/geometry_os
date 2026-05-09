; DESCRIPTION: Draws a purple rectangle at (389, 24) with width 101 and height 30.
; PLAN: r0=389(x), r1=24(y), r2=101(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 24
LDI r2, 101
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
