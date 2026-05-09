; DESCRIPTION: Draws a white rectangle at (159, 203) with width 116 and height 25.
; PLAN: r0=159(x), r1=203(y), r2=116(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 203
LDI r2, 116
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
