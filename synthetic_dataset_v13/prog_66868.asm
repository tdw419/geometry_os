; DESCRIPTION: Draws a white rectangle at (225, 122) with width 70 and height 116.
; PLAN: r0=225(x), r1=122(y), r2=70(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 122
LDI r2, 70
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
