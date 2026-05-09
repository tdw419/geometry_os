; DESCRIPTION: Draws a yellow rectangle at (2, 62) with width 15 and height 20.
; PLAN: r0=2(x), r1=62(y), r2=15(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 62
LDI r2, 15
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
