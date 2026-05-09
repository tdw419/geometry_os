; DESCRIPTION: Draws a green rectangle at (378, 181) with width 102 and height 43.
; PLAN: r0=378(x), r1=181(y), r2=102(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 181
LDI r2, 102
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
