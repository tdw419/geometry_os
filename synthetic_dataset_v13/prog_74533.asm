; DESCRIPTION: Draws a black rectangle at (343, 131) with width 102 and height 114.
; PLAN: r0=343(x), r1=131(y), r2=102(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 131
LDI r2, 102
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
