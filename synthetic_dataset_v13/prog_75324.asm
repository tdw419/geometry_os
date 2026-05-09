; DESCRIPTION: Draws a black rectangle at (316, 76) with width 77 and height 91.
; PLAN: r0=316(x), r1=76(y), r2=77(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 76
LDI r2, 77
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
