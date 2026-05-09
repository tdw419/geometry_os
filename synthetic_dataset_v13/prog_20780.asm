; DESCRIPTION: Draws a purple rectangle at (163, 5) with width 81 and height 70.
; PLAN: r0=163(x), r1=5(y), r2=81(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 5
LDI r2, 81
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
