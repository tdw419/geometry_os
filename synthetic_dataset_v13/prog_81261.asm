; DESCRIPTION: Draws a purple rectangle at (363, 87) with width 43 and height 106.
; PLAN: r0=363(x), r1=87(y), r2=43(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 87
LDI r2, 43
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
