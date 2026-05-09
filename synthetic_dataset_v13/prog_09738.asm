; DESCRIPTION: Draws a black rectangle at (266, 40) with width 68 and height 79.
; PLAN: r0=266(x), r1=40(y), r2=68(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 40
LDI r2, 68
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
