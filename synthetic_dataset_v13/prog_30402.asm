; DESCRIPTION: Draws a yellow rectangle at (41, 71) with width 94 and height 81.
; PLAN: r0=41(x), r1=71(y), r2=94(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 71
LDI r2, 94
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
