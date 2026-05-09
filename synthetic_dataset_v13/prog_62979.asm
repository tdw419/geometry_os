; DESCRIPTION: Draws a purple rectangle at (112, 119) with width 50 and height 89.
; PLAN: r0=112(x), r1=119(y), r2=50(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 119
LDI r2, 50
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
