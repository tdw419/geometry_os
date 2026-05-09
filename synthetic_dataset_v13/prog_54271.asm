; DESCRIPTION: Draws a blue rectangle at (378, 37) with width 36 and height 119.
; PLAN: r0=378(x), r1=37(y), r2=36(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 37
LDI r2, 36
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
