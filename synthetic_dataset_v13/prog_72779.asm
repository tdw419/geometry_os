; DESCRIPTION: Draws a orange circle centered at (97, 179) with radius 37.
; PLAN: r0=97(x), r1=179(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 179
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
