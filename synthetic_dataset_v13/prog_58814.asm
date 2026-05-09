; DESCRIPTION: Draws a magenta rectangle at (181, 158) with width 84 and height 77.
; PLAN: r0=181(x), r1=158(y), r2=84(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 158
LDI r2, 84
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
