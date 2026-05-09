; DESCRIPTION: Draws a blue rectangle at (378, 62) with width 102 and height 112.
; PLAN: r0=378(x), r1=62(y), r2=102(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 62
LDI r2, 102
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
