; DESCRIPTION: Draws a yellow rectangle at (41, 185) with width 68 and height 39.
; PLAN: r0=41(x), r1=185(y), r2=68(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 185
LDI r2, 68
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
