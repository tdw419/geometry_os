; DESCRIPTION: Draws a green rectangle at (89, 62) with width 48 and height 99.
; PLAN: r0=89(x), r1=62(y), r2=48(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 62
LDI r2, 48
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
