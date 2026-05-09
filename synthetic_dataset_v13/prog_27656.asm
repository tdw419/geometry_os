; DESCRIPTION: Draws a blue rectangle at (22, 169) with width 14 and height 41.
; PLAN: r0=22(x), r1=169(y), r2=14(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 169
LDI r2, 14
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
