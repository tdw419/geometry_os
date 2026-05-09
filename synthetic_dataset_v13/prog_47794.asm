; DESCRIPTION: Draws a red rectangle at (478, 203) with width 33 and height 47.
; PLAN: r0=478(x), r1=203(y), r2=33(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 203
LDI r2, 33
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
