; DESCRIPTION: Draws a purple rectangle at (93, 147) with width 75 and height 79.
; PLAN: r0=93(x), r1=147(y), r2=75(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 147
LDI r2, 75
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
