; DESCRIPTION: Draws a green rectangle at (88, 159) with width 40 and height 11.
; PLAN: r0=88(x), r1=159(y), r2=40(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 159
LDI r2, 40
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
