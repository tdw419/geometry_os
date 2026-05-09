; DESCRIPTION: Draws a white rectangle at (89, 69) with width 53 and height 99.
; PLAN: r0=89(x), r1=69(y), r2=53(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 69
LDI r2, 53
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
