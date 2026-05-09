; DESCRIPTION: Draws a white rectangle at (227, 39) with width 101 and height 70.
; PLAN: r0=227(x), r1=39(y), r2=101(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 39
LDI r2, 101
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
