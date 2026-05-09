; DESCRIPTION: Draws a white rectangle at (26, 100) with width 36 and height 29.
; PLAN: r0=26(x), r1=100(y), r2=36(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 100
LDI r2, 36
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
