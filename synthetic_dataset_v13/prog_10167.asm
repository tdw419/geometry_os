; DESCRIPTION: Draws a red rectangle at (12, 116) with width 51 and height 81.
; PLAN: r0=12(x), r1=116(y), r2=51(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 116
LDI r2, 51
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
