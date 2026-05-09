; DESCRIPTION: Draws a purple rectangle at (325, 176) with width 54 and height 28.
; PLAN: r0=325(x), r1=176(y), r2=54(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 176
LDI r2, 54
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
