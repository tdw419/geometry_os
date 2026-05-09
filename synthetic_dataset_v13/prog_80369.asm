; DESCRIPTION: Draws a magenta rectangle at (20, 137) with width 35 and height 96.
; PLAN: r0=20(x), r1=137(y), r2=35(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 137
LDI r2, 35
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
