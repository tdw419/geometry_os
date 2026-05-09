; DESCRIPTION: Draws a magenta rectangle at (25, 132) with width 79 and height 46.
; PLAN: r0=25(x), r1=132(y), r2=79(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 132
LDI r2, 79
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
