; DESCRIPTION: Draws a magenta rectangle at (77, 137) with width 11 and height 114.
; PLAN: r0=77(x), r1=137(y), r2=11(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 137
LDI r2, 11
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
