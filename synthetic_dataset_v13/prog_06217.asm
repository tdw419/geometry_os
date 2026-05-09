; DESCRIPTION: Draws a green circle centered at (110, 191) with radius 17.
; PLAN: r0=110(x), r1=191(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 191
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
