; DESCRIPTION: Draws a black rectangle at (190, 15) with width 13 and height 95.
; PLAN: r0=190(x), r1=15(y), r2=13(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 15
LDI r2, 13
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
