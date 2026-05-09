; DESCRIPTION: Draws a purple rectangle at (402, 52) with width 83 and height 20.
; PLAN: r0=402(x), r1=52(y), r2=83(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 52
LDI r2, 83
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
