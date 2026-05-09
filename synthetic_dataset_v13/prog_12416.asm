; DESCRIPTION: Draws a black rectangle at (331, 137) with width 96 and height 118.
; PLAN: r0=331(x), r1=137(y), r2=96(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 137
LDI r2, 96
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
