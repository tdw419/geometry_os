; DESCRIPTION: Draws a green rectangle at (396, 41) with width 74 and height 115.
; PLAN: r0=396(x), r1=41(y), r2=74(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 41
LDI r2, 74
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
