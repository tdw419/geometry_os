; DESCRIPTION: Draws a black rectangle at (93, 26) with width 89 and height 116.
; PLAN: r0=93(x), r1=26(y), r2=89(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 26
LDI r2, 89
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
