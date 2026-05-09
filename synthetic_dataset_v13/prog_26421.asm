; DESCRIPTION: Draws a red rectangle at (51, 116) with width 34 and height 119.
; PLAN: r0=51(x), r1=116(y), r2=34(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 116
LDI r2, 34
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
