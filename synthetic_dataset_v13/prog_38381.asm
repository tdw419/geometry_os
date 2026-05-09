; DESCRIPTION: Draws a yellow rectangle at (127, 156) with width 97 and height 36.
; PLAN: r0=127(x), r1=156(y), r2=97(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 156
LDI r2, 97
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
