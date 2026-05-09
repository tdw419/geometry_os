; DESCRIPTION: Draws a black rectangle at (318, 79) with width 17 and height 75.
; PLAN: r0=318(x), r1=79(y), r2=17(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 79
LDI r2, 17
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
