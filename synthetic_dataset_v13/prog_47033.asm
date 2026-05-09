; DESCRIPTION: Draws a white rectangle at (41, 166) with width 81 and height 16.
; PLAN: r0=41(x), r1=166(y), r2=81(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 166
LDI r2, 81
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
