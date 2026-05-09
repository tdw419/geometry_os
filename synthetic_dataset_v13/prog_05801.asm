; DESCRIPTION: Draws a white rectangle at (90, 41) with width 81 and height 76.
; PLAN: r0=90(x), r1=41(y), r2=81(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 41
LDI r2, 81
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
