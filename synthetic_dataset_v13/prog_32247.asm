; DESCRIPTION: Draws a purple rectangle at (62, 32) with width 44 and height 73.
; PLAN: r0=62(x), r1=32(y), r2=44(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 32
LDI r2, 44
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
