; DESCRIPTION: Draws a red rectangle at (194, 15) with width 34 and height 84.
; PLAN: r0=194(x), r1=15(y), r2=34(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 15
LDI r2, 34
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
