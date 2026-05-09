; DESCRIPTION: Draws a black rectangle at (212, 10) with width 65 and height 110.
; PLAN: r0=212(x), r1=10(y), r2=65(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 10
LDI r2, 65
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
