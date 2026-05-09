; DESCRIPTION: Draws a purple rectangle at (402, 101) with width 87 and height 46.
; PLAN: r0=402(x), r1=101(y), r2=87(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 101
LDI r2, 87
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
