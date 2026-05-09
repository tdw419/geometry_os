; DESCRIPTION: Draws a yellow rectangle at (30, 65) with width 13 and height 84.
; PLAN: r0=30(x), r1=65(y), r2=13(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 65
LDI r2, 13
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
