; DESCRIPTION: Draws a white rectangle at (204, 69) with width 73 and height 105.
; PLAN: r0=204(x), r1=69(y), r2=73(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 69
LDI r2, 73
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
