; DESCRIPTION: Draws a white rectangle at (207, 172) with width 47 and height 41.
; PLAN: r0=207(x), r1=172(y), r2=47(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 172
LDI r2, 47
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
