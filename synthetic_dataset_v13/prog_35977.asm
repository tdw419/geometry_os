; DESCRIPTION: Draws a yellow rectangle at (325, 204) with width 106 and height 14.
; PLAN: r0=325(x), r1=204(y), r2=106(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 204
LDI r2, 106
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
