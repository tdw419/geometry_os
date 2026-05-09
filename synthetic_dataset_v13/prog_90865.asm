; DESCRIPTION: Draws a white rectangle at (107, 162) with width 31 and height 53.
; PLAN: r0=107(x), r1=162(y), r2=31(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 162
LDI r2, 31
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
