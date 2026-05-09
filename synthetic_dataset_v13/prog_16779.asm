; DESCRIPTION: Draws a purple rectangle at (233, 142) with width 100 and height 64.
; PLAN: r0=233(x), r1=142(y), r2=100(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 142
LDI r2, 100
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
