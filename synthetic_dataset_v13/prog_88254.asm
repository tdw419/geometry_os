; DESCRIPTION: Draws a yellow rectangle at (211, 189) with width 15 and height 41.
; PLAN: r0=211(x), r1=189(y), r2=15(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 189
LDI r2, 15
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
