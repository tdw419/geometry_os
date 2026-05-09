; DESCRIPTION: Draws a purple rectangle at (232, 84) with width 80 and height 109.
; PLAN: r0=232(x), r1=84(y), r2=80(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 84
LDI r2, 80
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
