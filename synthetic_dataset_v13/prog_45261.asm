; DESCRIPTION: Draws a magenta rectangle at (137, 80) with width 74 and height 115.
; PLAN: r0=137(x), r1=80(y), r2=74(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 80
LDI r2, 74
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
