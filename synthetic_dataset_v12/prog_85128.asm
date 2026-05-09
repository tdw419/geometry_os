; DESCRIPTION: Draws a white rectangle at (203, 52) with width 81 and height 78.
; PLAN: r0=203(x), r1=52(y), r2=81(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 52
LDI r2, 81
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
