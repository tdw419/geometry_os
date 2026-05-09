; DESCRIPTION: Draws a magenta rectangle at (97, 22) with width 94 and height 85.
; PLAN: r0=97(x), r1=22(y), r2=94(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 22
LDI r2, 94
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
