; DESCRIPTION: Draws a yellow rectangle at (461, 78) with width 41 and height 23.
; PLAN: r0=461(x), r1=78(y), r2=41(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 78
LDI r2, 41
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
