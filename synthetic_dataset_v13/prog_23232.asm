; DESCRIPTION: Draws a green rectangle at (195, 101) with width 18 and height 37.
; PLAN: r0=195(x), r1=101(y), r2=18(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 101
LDI r2, 18
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
