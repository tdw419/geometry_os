; DESCRIPTION: Draws a magenta rectangle at (390, 27) with width 58 and height 66.
; PLAN: r0=390(x), r1=27(y), r2=58(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 27
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
