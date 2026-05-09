; DESCRIPTION: Draws a yellow rectangle at (343, 182) with width 110 and height 66.
; PLAN: r0=343(x), r1=182(y), r2=110(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 182
LDI r2, 110
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
