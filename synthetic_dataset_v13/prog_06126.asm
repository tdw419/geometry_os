; DESCRIPTION: Draws a purple rectangle at (314, 82) with width 101 and height 19.
; PLAN: r0=314(x), r1=82(y), r2=101(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 82
LDI r2, 101
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
