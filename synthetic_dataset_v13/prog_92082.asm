; DESCRIPTION: Draws a magenta rectangle at (206, 91) with width 66 and height 26.
; PLAN: r0=206(x), r1=91(y), r2=66(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 91
LDI r2, 66
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
