; DESCRIPTION: Draws a white rectangle at (217, 2) with width 80 and height 41.
; PLAN: r0=217(x), r1=2(y), r2=80(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 2
LDI r2, 80
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
