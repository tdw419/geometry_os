; DESCRIPTION: Draws a white rectangle at (27, 169) with width 79 and height 41.
; PLAN: r0=27(x), r1=169(y), r2=79(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 169
LDI r2, 79
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
