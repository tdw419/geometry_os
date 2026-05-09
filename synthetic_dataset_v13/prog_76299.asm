; DESCRIPTION: Draws a cyan rectangle at (41, 216) with width 55 and height 17.
; PLAN: r0=41(x), r1=216(y), r2=55(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 216
LDI r2, 55
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
