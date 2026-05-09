; DESCRIPTION: Draws a purple rectangle at (104, 84) with width 97 and height 92.
; PLAN: r0=104(x), r1=84(y), r2=97(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 84
LDI r2, 97
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
