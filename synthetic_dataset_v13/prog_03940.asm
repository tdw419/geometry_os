; DESCRIPTION: Draws a white rectangle at (95, 4) with width 27 and height 41.
; PLAN: r0=95(x), r1=4(y), r2=27(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 4
LDI r2, 27
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
