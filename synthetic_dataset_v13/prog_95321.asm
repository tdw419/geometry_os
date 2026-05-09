; DESCRIPTION: Draws a red rectangle at (289, 122) with width 114 and height 81.
; PLAN: r0=289(x), r1=122(y), r2=114(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 122
LDI r2, 114
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
