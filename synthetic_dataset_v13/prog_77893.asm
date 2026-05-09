; DESCRIPTION: Draws a black rectangle at (351, 199) with width 89 and height 48.
; PLAN: r0=351(x), r1=199(y), r2=89(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 199
LDI r2, 89
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
