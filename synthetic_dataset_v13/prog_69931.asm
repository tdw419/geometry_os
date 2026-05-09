; DESCRIPTION: Draws a yellow rectangle at (205, 166) with width 41 and height 43.
; PLAN: r0=205(x), r1=166(y), r2=41(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 166
LDI r2, 41
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
