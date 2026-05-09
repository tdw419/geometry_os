; DESCRIPTION: Draws a black rectangle at (9, 24) with width 96 and height 79.
; PLAN: r0=9(x), r1=24(y), r2=96(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 24
LDI r2, 96
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
