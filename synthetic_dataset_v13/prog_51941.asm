; DESCRIPTION: Draws a purple rectangle at (81, 102) with width 114 and height 61.
; PLAN: r0=81(x), r1=102(y), r2=114(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 102
LDI r2, 114
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
