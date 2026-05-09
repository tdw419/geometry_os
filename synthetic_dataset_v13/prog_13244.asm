; DESCRIPTION: Draws a green rectangle at (341, 87) with width 79 and height 91.
; PLAN: r0=341(x), r1=87(y), r2=79(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 87
LDI r2, 79
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
