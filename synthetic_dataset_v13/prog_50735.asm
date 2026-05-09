; DESCRIPTION: Draws a white rectangle at (216, 17) with width 76 and height 53.
; PLAN: r0=216(x), r1=17(y), r2=76(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 17
LDI r2, 76
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
