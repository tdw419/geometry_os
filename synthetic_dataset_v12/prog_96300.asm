; DESCRIPTION: Draws a blue rectangle at (378, 41) with width 17 and height 98.
; PLAN: r0=378(x), r1=41(y), r2=17(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 41
LDI r2, 17
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
