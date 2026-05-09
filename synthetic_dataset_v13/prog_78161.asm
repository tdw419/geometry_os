; DESCRIPTION: Draws a purple rectangle at (225, 112) with width 23 and height 84.
; PLAN: r0=225(x), r1=112(y), r2=23(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 112
LDI r2, 23
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
