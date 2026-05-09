; DESCRIPTION: Draws a yellow rectangle at (88, 26) with width 87 and height 97.
; PLAN: r0=88(x), r1=26(y), r2=87(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 26
LDI r2, 87
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
