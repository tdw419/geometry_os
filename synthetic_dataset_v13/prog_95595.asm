; DESCRIPTION: Draws a green rectangle at (62, 84) with width 100 and height 40.
; PLAN: r0=62(x), r1=84(y), r2=100(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 84
LDI r2, 100
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
