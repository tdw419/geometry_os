; DESCRIPTION: Draws a yellow rectangle at (91, 76) with width 81 and height 41.
; PLAN: r0=91(x), r1=76(y), r2=81(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 76
LDI r2, 81
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
