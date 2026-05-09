; DESCRIPTION: Draws a yellow rectangle at (274, 9) with width 101 and height 25.
; PLAN: r0=274(x), r1=9(y), r2=101(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 9
LDI r2, 101
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
