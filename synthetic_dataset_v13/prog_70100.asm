; DESCRIPTION: Draws a purple rectangle at (234, 78) with width 35 and height 48.
; PLAN: r0=234(x), r1=78(y), r2=35(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 78
LDI r2, 35
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
