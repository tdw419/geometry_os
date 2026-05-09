; DESCRIPTION: Draws a red rectangle at (203, 88) with width 34 and height 80.
; PLAN: r0=203(x), r1=88(y), r2=34(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 88
LDI r2, 34
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
