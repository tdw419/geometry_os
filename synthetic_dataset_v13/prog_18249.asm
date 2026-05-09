; DESCRIPTION: Draws a purple rectangle at (234, 224) with width 19 and height 21.
; PLAN: r0=234(x), r1=224(y), r2=19(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 224
LDI r2, 19
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
