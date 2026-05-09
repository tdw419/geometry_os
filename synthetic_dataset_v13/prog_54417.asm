; DESCRIPTION: Draws a orange rectangle at (203, 120) with width 71 and height 11.
; PLAN: r0=203(x), r1=120(y), r2=71(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 120
LDI r2, 71
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
