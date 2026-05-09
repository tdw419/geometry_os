; DESCRIPTION: Draws a black rectangle at (199, 118) with width 53 and height 29.
; PLAN: r0=199(x), r1=118(y), r2=53(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 118
LDI r2, 53
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
