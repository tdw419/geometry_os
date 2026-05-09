; DESCRIPTION: Draws a purple rectangle at (234, 5) with width 119 and height 90.
; PLAN: r0=234(x), r1=5(y), r2=119(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 5
LDI r2, 119
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
