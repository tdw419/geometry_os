; DESCRIPTION: Draws a purple rectangle at (32, 87) with width 80 and height 88.
; PLAN: r0=32(x), r1=87(y), r2=80(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 87
LDI r2, 80
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
