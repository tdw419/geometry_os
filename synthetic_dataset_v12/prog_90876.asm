; DESCRIPTION: Draws a green rectangle at (35, 137) with width 36 and height 79.
; PLAN: r0=35(x), r1=137(y), r2=36(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 137
LDI r2, 36
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
