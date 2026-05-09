; DESCRIPTION: Draws a yellow rectangle at (254, 68) with width 54 and height 41.
; PLAN: r0=254(x), r1=68(y), r2=54(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 68
LDI r2, 54
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
