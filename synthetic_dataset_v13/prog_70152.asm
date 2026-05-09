; DESCRIPTION: Draws a purple rectangle at (424, 147) with width 78 and height 53.
; PLAN: r0=424(x), r1=147(y), r2=78(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 147
LDI r2, 78
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
