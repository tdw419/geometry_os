; DESCRIPTION: Draws a yellow rectangle at (122, 158) with width 46 and height 83.
; PLAN: r0=122(x), r1=158(y), r2=46(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 158
LDI r2, 46
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
