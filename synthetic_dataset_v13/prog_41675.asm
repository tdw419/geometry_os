; DESCRIPTION: Draws a purple rectangle at (147, 10) with width 81 and height 52.
; PLAN: r0=147(x), r1=10(y), r2=81(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 10
LDI r2, 81
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
