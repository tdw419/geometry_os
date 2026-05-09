; DESCRIPTION: Draws a purple rectangle at (10, 137) with width 102 and height 105.
; PLAN: r0=10(x), r1=137(y), r2=102(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 137
LDI r2, 102
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
