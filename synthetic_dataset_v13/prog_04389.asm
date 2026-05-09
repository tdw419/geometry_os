; DESCRIPTION: Draws a black rectangle at (190, 155) with width 61 and height 69.
; PLAN: r0=190(x), r1=155(y), r2=61(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 155
LDI r2, 61
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
