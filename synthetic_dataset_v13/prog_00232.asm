; DESCRIPTION: Draws a green rectangle at (216, 125) with width 41 and height 80.
; PLAN: r0=216(x), r1=125(y), r2=41(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 125
LDI r2, 41
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
