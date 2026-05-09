; DESCRIPTION: Draws a black rectangle at (190, 16) with width 118 and height 41.
; PLAN: r0=190(x), r1=16(y), r2=118(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 16
LDI r2, 118
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
