; DESCRIPTION: Draws a yellow rectangle at (206, 1) with width 119 and height 15.
; PLAN: r0=206(x), r1=1(y), r2=119(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 1
LDI r2, 119
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
