; DESCRIPTION: Draws a purple rectangle at (192, 5) with width 86 and height 19.
; PLAN: r0=192(x), r1=5(y), r2=86(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 5
LDI r2, 86
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
