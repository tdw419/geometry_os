; DESCRIPTION: Draws a purple rectangle at (176, 76) with width 114 and height 106.
; PLAN: r0=176(x), r1=76(y), r2=114(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 76
LDI r2, 114
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
