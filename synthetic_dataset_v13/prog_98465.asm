; DESCRIPTION: Draws a purple rectangle at (314, 158) with width 85 and height 64.
; PLAN: r0=314(x), r1=158(y), r2=85(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 158
LDI r2, 85
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
