; DESCRIPTION: Draws a yellow rectangle at (129, 123) with width 95 and height 25.
; PLAN: r0=129(x), r1=123(y), r2=95(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 123
LDI r2, 95
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
