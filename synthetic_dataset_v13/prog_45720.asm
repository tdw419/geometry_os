; DESCRIPTION: Draws a white rectangle at (229, 8) with width 41 and height 104.
; PLAN: r0=229(x), r1=8(y), r2=41(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 8
LDI r2, 41
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
