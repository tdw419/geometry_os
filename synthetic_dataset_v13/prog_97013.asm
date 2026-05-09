; DESCRIPTION: Draws a yellow rectangle at (206, 123) with width 29 and height 76.
; PLAN: r0=206(x), r1=123(y), r2=29(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 123
LDI r2, 29
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
