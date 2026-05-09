; DESCRIPTION: Draws a black rectangle at (83, 199) with width 99 and height 49.
; PLAN: r0=83(x), r1=199(y), r2=99(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 199
LDI r2, 99
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
