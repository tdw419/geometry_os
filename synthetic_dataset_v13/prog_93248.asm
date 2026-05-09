; DESCRIPTION: Draws a black rectangle at (457, 18) with width 15 and height 79.
; PLAN: r0=457(x), r1=18(y), r2=15(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 18
LDI r2, 15
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
