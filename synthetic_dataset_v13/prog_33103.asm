; DESCRIPTION: Draws a purple rectangle at (158, 39) with width 114 and height 112.
; PLAN: r0=158(x), r1=39(y), r2=114(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 39
LDI r2, 114
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
