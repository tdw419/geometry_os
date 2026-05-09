; DESCRIPTION: Draws a purple rectangle at (2, 137) with width 24 and height 10.
; PLAN: r0=2(x), r1=137(y), r2=24(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 137
LDI r2, 24
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
