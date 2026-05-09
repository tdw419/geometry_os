; DESCRIPTION: Draws a purple rectangle at (83, 8) with width 80 and height 76.
; PLAN: r0=83(x), r1=8(y), r2=80(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 8
LDI r2, 80
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
