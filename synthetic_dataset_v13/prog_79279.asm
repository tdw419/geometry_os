; DESCRIPTION: Draws a magenta rectangle at (26, 81) with width 119 and height 117.
; PLAN: r0=26(x), r1=81(y), r2=119(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 81
LDI r2, 119
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
