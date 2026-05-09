; DESCRIPTION: Draws a black rectangle at (203, 138) with width 84 and height 85.
; PLAN: r0=203(x), r1=138(y), r2=84(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 138
LDI r2, 84
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
