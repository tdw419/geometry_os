; DESCRIPTION: Draws a yellow rectangle at (191, 11) with width 25 and height 13.
; PLAN: r0=191(x), r1=11(y), r2=25(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 11
LDI r2, 25
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
