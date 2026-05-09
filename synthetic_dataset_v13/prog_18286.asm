; DESCRIPTION: Draws a purple rectangle at (172, 89) with width 50 and height 119.
; PLAN: r0=172(x), r1=89(y), r2=50(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 89
LDI r2, 50
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
