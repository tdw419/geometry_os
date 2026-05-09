; DESCRIPTION: Draws a black rectangle at (192, 83) with width 89 and height 102.
; PLAN: r0=192(x), r1=83(y), r2=89(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 83
LDI r2, 89
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
