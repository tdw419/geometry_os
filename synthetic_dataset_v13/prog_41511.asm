; DESCRIPTION: Draws a yellow rectangle at (33, 147) with width 101 and height 10.
; PLAN: r0=33(x), r1=147(y), r2=101(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 147
LDI r2, 101
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
