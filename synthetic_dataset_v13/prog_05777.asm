; DESCRIPTION: Draws a white rectangle at (355, 17) with width 14 and height 15.
; PLAN: r0=355(x), r1=17(y), r2=14(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 17
LDI r2, 14
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
