; DESCRIPTION: Draws a black rectangle at (194, 175) with width 87 and height 65.
; PLAN: r0=194(x), r1=175(y), r2=87(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 175
LDI r2, 87
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
