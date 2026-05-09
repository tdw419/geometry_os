; DESCRIPTION: Draws a white rectangle at (298, 41) with width 15 and height 63.
; PLAN: r0=298(x), r1=41(y), r2=15(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 41
LDI r2, 15
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
