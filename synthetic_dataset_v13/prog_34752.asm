; DESCRIPTION: Draws a purple rectangle at (351, 186) with width 75 and height 63.
; PLAN: r0=351(x), r1=186(y), r2=75(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 186
LDI r2, 75
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
