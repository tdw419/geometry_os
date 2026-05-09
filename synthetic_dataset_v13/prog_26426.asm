; DESCRIPTION: Draws a green rectangle at (378, 162) with width 37 and height 46.
; PLAN: r0=378(x), r1=162(y), r2=37(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 162
LDI r2, 37
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
