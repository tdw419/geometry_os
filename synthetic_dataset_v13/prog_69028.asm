; DESCRIPTION: Draws a blue rectangle at (99, 11) with width 119 and height 54.
; PLAN: r0=99(x), r1=11(y), r2=119(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 11
LDI r2, 119
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
