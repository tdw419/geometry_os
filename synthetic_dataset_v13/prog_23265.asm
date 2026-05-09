; DESCRIPTION: Draws a purple rectangle at (273, 90) with width 90 and height 22.
; PLAN: r0=273(x), r1=90(y), r2=90(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 90
LDI r2, 90
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
