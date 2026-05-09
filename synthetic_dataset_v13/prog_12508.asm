; DESCRIPTION: Draws a white rectangle at (71, 122) with width 15 and height 76.
; PLAN: r0=71(x), r1=122(y), r2=15(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 122
LDI r2, 15
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
