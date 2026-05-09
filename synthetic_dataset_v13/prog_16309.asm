; DESCRIPTION: Draws a yellow rectangle at (260, 12) with width 35 and height 100.
; PLAN: r0=260(x), r1=12(y), r2=35(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 12
LDI r2, 35
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
