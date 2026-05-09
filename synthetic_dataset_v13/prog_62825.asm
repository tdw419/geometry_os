; DESCRIPTION: Draws a white rectangle at (431, 24) with width 41 and height 100.
; PLAN: r0=431(x), r1=24(y), r2=41(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 24
LDI r2, 41
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
