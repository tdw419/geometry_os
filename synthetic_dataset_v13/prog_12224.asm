; DESCRIPTION: Draws a green rectangle at (149, 144) with width 41 and height 12.
; PLAN: r0=149(x), r1=144(y), r2=41(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 144
LDI r2, 41
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
