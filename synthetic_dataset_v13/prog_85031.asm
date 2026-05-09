; DESCRIPTION: Draws a red rectangle at (312, 43) with width 30 and height 76.
; PLAN: r0=312(x), r1=43(y), r2=30(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 43
LDI r2, 30
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
