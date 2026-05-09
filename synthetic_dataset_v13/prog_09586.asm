; DESCRIPTION: Draws a magenta rectangle at (390, 40) with width 104 and height 97.
; PLAN: r0=390(x), r1=40(y), r2=104(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 40
LDI r2, 104
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
