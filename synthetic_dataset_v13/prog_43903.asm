; DESCRIPTION: Draws a purple rectangle at (68, 92) with width 96 and height 118.
; PLAN: r0=68(x), r1=92(y), r2=96(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 92
LDI r2, 96
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
