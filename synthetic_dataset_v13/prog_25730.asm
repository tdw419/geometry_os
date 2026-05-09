; DESCRIPTION: Draws a yellow rectangle at (97, 139) with width 34 and height 22.
; PLAN: r0=97(x), r1=139(y), r2=34(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 139
LDI r2, 34
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
