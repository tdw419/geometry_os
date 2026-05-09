; DESCRIPTION: Draws a orange rectangle at (293, 203) with width 18 and height 52.
; PLAN: r0=293(x), r1=203(y), r2=18(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 203
LDI r2, 18
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
