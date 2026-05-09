; DESCRIPTION: Draws a white rectangle at (378, 225) with width 15 and height 18.
; PLAN: r0=378(x), r1=225(y), r2=15(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 225
LDI r2, 15
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
