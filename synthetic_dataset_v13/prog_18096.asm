; DESCRIPTION: Draws a green rectangle at (6, 43) with width 102 and height 110.
; PLAN: r0=6(x), r1=43(y), r2=102(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 43
LDI r2, 102
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
