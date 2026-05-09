; DESCRIPTION: Draws a magenta rectangle at (490, 226) with width 11 and height 23.
; PLAN: r0=490(x), r1=226(y), r2=11(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 226
LDI r2, 11
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
