; DESCRIPTION: Draws a purple rectangle at (114, 118) with width 92 and height 52.
; PLAN: r0=114(x), r1=118(y), r2=92(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 118
LDI r2, 92
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
