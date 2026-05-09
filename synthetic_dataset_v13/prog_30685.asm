; DESCRIPTION: Draws a orange rectangle at (203, 9) with width 105 and height 90.
; PLAN: r0=203(x), r1=9(y), r2=105(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 9
LDI r2, 105
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
