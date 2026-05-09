; DESCRIPTION: Draws a purple rectangle at (31, 74) with width 114 and height 64.
; PLAN: r0=31(x), r1=74(y), r2=114(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 74
LDI r2, 114
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
