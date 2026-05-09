; DESCRIPTION: Draws a magenta rectangle at (196, 137) with width 35 and height 75.
; PLAN: r0=196(x), r1=137(y), r2=35(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 137
LDI r2, 35
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
