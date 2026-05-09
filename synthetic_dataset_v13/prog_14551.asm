; DESCRIPTION: Draws a yellow rectangle at (375, 119) with width 90 and height 110.
; PLAN: r0=375(x), r1=119(y), r2=90(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 119
LDI r2, 90
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
