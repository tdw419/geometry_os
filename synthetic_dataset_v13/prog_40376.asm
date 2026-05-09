; DESCRIPTION: Draws a magenta rectangle at (101, 51) with width 118 and height 40.
; PLAN: r0=101(x), r1=51(y), r2=118(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 51
LDI r2, 118
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
