; DESCRIPTION: Draws a green rectangle at (232, 180) with width 41 and height 23.
; PLAN: r0=232(x), r1=180(y), r2=41(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 180
LDI r2, 41
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
