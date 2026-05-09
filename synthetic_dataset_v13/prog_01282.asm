; DESCRIPTION: Draws a yellow rectangle at (41, 109) with width 100 and height 50.
; PLAN: r0=41(x), r1=109(y), r2=100(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 109
LDI r2, 100
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
