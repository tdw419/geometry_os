; DESCRIPTION: Draws a purple rectangle at (314, 101) with width 85 and height 39.
; PLAN: r0=314(x), r1=101(y), r2=85(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 101
LDI r2, 85
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
