; DESCRIPTION: Draws a black rectangle at (18, 81) with width 116 and height 62.
; PLAN: r0=18(x), r1=81(y), r2=116(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 81
LDI r2, 116
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
