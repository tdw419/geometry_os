; DESCRIPTION: Draws a green rectangle at (189, 7) with width 84 and height 15.
; PLAN: r0=189(x), r1=7(y), r2=84(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 7
LDI r2, 84
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
