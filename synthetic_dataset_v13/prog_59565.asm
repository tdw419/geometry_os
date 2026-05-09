; DESCRIPTION: Draws a yellow rectangle at (108, 101) with width 13 and height 34.
; PLAN: r0=108(x), r1=101(y), r2=13(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 101
LDI r2, 13
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
