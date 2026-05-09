; DESCRIPTION: Draws a yellow rectangle at (407, 158) with width 96 and height 79.
; PLAN: r0=407(x), r1=158(y), r2=96(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 158
LDI r2, 96
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
