; DESCRIPTION: Draws a purple rectangle at (101, 93) with width 118 and height 74.
; PLAN: r0=101(x), r1=93(y), r2=118(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 93
LDI r2, 118
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
