; DESCRIPTION: Draws a red rectangle at (71, 137) with width 77 and height 116.
; PLAN: r0=71(x), r1=137(y), r2=77(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 137
LDI r2, 77
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
