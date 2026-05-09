; DESCRIPTION: Draws a orange rectangle at (22, 203) with width 109 and height 45.
; PLAN: r0=22(x), r1=203(y), r2=109(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 203
LDI r2, 109
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
