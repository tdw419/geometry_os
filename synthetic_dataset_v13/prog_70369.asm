; DESCRIPTION: Draws a orange circle centered at (97, 236) with radius 14.
; PLAN: r0=97(x), r1=236(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 236
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
