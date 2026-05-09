; DESCRIPTION: Draws a white rectangle at (312, 24) with width 100 and height 39.
; PLAN: r0=312(x), r1=24(y), r2=100(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 24
LDI r2, 100
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
