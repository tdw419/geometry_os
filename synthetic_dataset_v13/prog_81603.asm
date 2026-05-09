; DESCRIPTION: Draws a black rectangle at (153, 179) with width 33 and height 41.
; PLAN: r0=153(x), r1=179(y), r2=33(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 179
LDI r2, 33
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
