; DESCRIPTION: Draws a yellow rectangle at (296, 119) with width 89 and height 66.
; PLAN: r0=296(x), r1=119(y), r2=89(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 119
LDI r2, 89
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
