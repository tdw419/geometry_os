; DESCRIPTION: Draws a black rectangle at (190, 158) with width 69 and height 86.
; PLAN: r0=190(x), r1=158(y), r2=69(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 158
LDI r2, 69
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
