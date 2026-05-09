; DESCRIPTION: Draws a yellow rectangle at (147, 33) with width 41 and height 117.
; PLAN: r0=147(x), r1=33(y), r2=41(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 33
LDI r2, 41
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
