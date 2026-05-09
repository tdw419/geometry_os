; DESCRIPTION: Draws a green rectangle at (148, 30) with width 89 and height 13.
; PLAN: r0=148(x), r1=30(y), r2=89(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 30
LDI r2, 89
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
