; DESCRIPTION: Draws a magenta rectangle at (175, 97) with width 101 and height 49.
; PLAN: r0=175(x), r1=97(y), r2=101(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 97
LDI r2, 101
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
