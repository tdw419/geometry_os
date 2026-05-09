; DESCRIPTION: Draws a black rectangle at (334, 79) with width 119 and height 109.
; PLAN: r0=334(x), r1=79(y), r2=119(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 79
LDI r2, 119
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
