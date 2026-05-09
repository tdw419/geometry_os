; DESCRIPTION: Draws a yellow rectangle at (231, 38) with width 41 and height 97.
; PLAN: r0=231(x), r1=38(y), r2=41(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 38
LDI r2, 41
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
