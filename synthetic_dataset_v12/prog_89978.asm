; DESCRIPTION: Renders a blue box of size 84x78 starting at (351, 81).
; PLAN: r0=351(x), r1=81(y), r2=84(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 81
LDI r2, 84
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
