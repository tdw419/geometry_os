; DESCRIPTION: Draws a yellow rectangle at (41, 160) with width 70 and height 18.
; PLAN: r0=41(x), r1=160(y), r2=70(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 160
LDI r2, 70
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
