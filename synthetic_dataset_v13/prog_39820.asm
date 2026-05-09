; DESCRIPTION: Draws a magenta rectangle at (251, 137) with width 69 and height 74.
; PLAN: r0=251(x), r1=137(y), r2=69(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 137
LDI r2, 69
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
