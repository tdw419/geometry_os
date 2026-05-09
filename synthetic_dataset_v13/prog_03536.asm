; DESCRIPTION: Draws a green rectangle at (117, 41) with width 110 and height 86.
; PLAN: r0=117(x), r1=41(y), r2=110(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 41
LDI r2, 110
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
