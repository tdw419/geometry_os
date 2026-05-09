; DESCRIPTION: Draws a green circle centered at (452, 185) with radius 33.
; PLAN: r0=452(x), r1=185(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 185
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
