; DESCRIPTION: Draws a white rectangle at (159, 137) with width 107 and height 85.
; PLAN: r0=159(x), r1=137(y), r2=107(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 137
LDI r2, 107
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
