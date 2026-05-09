; DESCRIPTION: Draws a white rectangle at (452, 167) with width 11 and height 12.
; PLAN: r0=452(x), r1=167(y), r2=11(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 167
LDI r2, 11
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
