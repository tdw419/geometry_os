; DESCRIPTION: Draws a magenta rectangle at (194, 97) with width 56 and height 85.
; PLAN: r0=194(x), r1=97(y), r2=56(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 97
LDI r2, 56
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
