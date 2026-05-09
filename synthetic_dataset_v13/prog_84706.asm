; DESCRIPTION: Draws a green rectangle at (97, 203) with width 76 and height 45.
; PLAN: r0=97(x), r1=203(y), r2=76(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 203
LDI r2, 76
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
