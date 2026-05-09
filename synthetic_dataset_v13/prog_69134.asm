; DESCRIPTION: Draws a green circle centered at (266, 65) with radius 31.
; PLAN: r0=266(x), r1=65(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 65
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
