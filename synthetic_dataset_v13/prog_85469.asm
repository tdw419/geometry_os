; DESCRIPTION: Draws a purple rectangle at (234, 119) with width 44 and height 21.
; PLAN: r0=234(x), r1=119(y), r2=44(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 119
LDI r2, 44
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
