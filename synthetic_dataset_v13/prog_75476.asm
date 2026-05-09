; DESCRIPTION: Draws a black rectangle at (217, 101) with width 77 and height 114.
; PLAN: r0=217(x), r1=101(y), r2=77(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 101
LDI r2, 77
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
