; DESCRIPTION: Draws a purple rectangle at (191, 147) with width 98 and height 34.
; PLAN: r0=191(x), r1=147(y), r2=98(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 147
LDI r2, 98
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
