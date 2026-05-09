; DESCRIPTION: Draws a purple rectangle at (13, 19) with width 60 and height 86.
; PLAN: r0=13(x), r1=19(y), r2=60(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 19
LDI r2, 60
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
