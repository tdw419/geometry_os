; DESCRIPTION: Draws a purple rectangle at (256, 89) with width 72 and height 98.
; PLAN: r0=256(x), r1=89(y), r2=72(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 89
LDI r2, 72
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
