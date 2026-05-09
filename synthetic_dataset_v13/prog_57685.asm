; DESCRIPTION: Draws a purple rectangle at (89, 3) with width 71 and height 37.
; PLAN: r0=89(x), r1=3(y), r2=71(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 3
LDI r2, 71
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
