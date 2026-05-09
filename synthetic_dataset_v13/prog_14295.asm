; DESCRIPTION: Draws a orange rectangle at (203, 4) with width 39 and height 33.
; PLAN: r0=203(x), r1=4(y), r2=39(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 4
LDI r2, 39
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
