; DESCRIPTION: Draws a yellow rectangle at (191, 91) with width 98 and height 74.
; PLAN: r0=191(x), r1=91(y), r2=98(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 91
LDI r2, 98
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
