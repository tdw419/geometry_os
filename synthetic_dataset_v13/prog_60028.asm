; DESCRIPTION: Draws a purple rectangle at (378, 3) with width 68 and height 29.
; PLAN: r0=378(x), r1=3(y), r2=68(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 3
LDI r2, 68
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
