; DESCRIPTION: Draws a purple rectangle at (193, 137) with width 44 and height 110.
; PLAN: r0=193(x), r1=137(y), r2=44(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 137
LDI r2, 44
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
