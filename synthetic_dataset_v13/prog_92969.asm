; DESCRIPTION: Draws a magenta rectangle at (189, 178) with width 97 and height 37.
; PLAN: r0=189(x), r1=178(y), r2=97(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 178
LDI r2, 97
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
