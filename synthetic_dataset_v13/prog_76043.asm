; DESCRIPTION: Draws a white rectangle at (268, 65) with width 95 and height 41.
; PLAN: r0=268(x), r1=65(y), r2=95(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 65
LDI r2, 95
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
