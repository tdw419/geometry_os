; DESCRIPTION: Draws a purple rectangle at (89, 89) with width 28 and height 48.
; PLAN: r0=89(x), r1=89(y), r2=28(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 89
LDI r2, 28
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
