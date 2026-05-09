; DESCRIPTION: Draws a blue rectangle at (351, 65) with width 118 and height 62.
; PLAN: r0=351(x), r1=65(y), r2=118(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 65
LDI r2, 118
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
