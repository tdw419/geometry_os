; DESCRIPTION: Draws a purple rectangle at (384, 100) with width 81 and height 20.
; PLAN: r0=384(x), r1=100(y), r2=81(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 100
LDI r2, 81
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
