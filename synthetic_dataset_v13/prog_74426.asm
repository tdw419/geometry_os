; DESCRIPTION: Draws a red rectangle at (81, 233) with width 88 and height 15.
; PLAN: r0=81(x), r1=233(y), r2=88(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 233
LDI r2, 88
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
