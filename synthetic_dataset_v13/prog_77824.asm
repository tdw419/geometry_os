; DESCRIPTION: Draws a white rectangle at (361, 103) with width 41 and height 98.
; PLAN: r0=361(x), r1=103(y), r2=41(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 103
LDI r2, 41
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
