; DESCRIPTION: Draws a magenta rectangle at (97, 132) with width 79 and height 117.
; PLAN: r0=97(x), r1=132(y), r2=79(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 132
LDI r2, 79
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
