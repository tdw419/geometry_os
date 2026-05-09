; DESCRIPTION: Draws a yellow rectangle at (170, 198) with width 10 and height 10.
; PLAN: r0=170(x), r1=198(y), r2=10(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 198
LDI r2, 10
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
