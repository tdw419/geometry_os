; DESCRIPTION: Draws a purple rectangle at (472, 45) with width 31 and height 62.
; PLAN: r0=472(x), r1=45(y), r2=31(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 45
LDI r2, 31
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
