; DESCRIPTION: Draws a magenta rectangle at (74, 198) with width 81 and height 25.
; PLAN: r0=74(x), r1=198(y), r2=81(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 198
LDI r2, 81
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
