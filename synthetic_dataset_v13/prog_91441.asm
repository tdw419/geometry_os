; DESCRIPTION: Draws a yellow rectangle at (88, 119) with width 88 and height 39.
; PLAN: r0=88(x), r1=119(y), r2=88(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 119
LDI r2, 88
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
