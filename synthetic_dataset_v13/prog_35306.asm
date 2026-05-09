; DESCRIPTION: Draws a white rectangle at (46, 110) with width 41 and height 19.
; PLAN: r0=46(x), r1=110(y), r2=41(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 110
LDI r2, 41
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
