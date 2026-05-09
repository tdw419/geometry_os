; DESCRIPTION: Draws a white rectangle at (149, 31) with width 105 and height 60.
; PLAN: r0=149(x), r1=31(y), r2=105(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 31
LDI r2, 105
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
