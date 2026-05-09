; DESCRIPTION: Draws a green rectangle at (137, 84) with width 24 and height 56.
; PLAN: r0=137(x), r1=84(y), r2=24(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 84
LDI r2, 24
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
