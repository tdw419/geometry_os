; DESCRIPTION: Draws a purple rectangle at (223, 147) with width 28 and height 87.
; PLAN: r0=223(x), r1=147(y), r2=28(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 147
LDI r2, 28
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
