; DESCRIPTION: Draws a magenta rectangle at (22, 43) with width 66 and height 37.
; PLAN: r0=22(x), r1=43(y), r2=66(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 43
LDI r2, 66
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
