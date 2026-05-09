; DESCRIPTION: Draws a green circle centered at (347, 117) with radius 73.
; PLAN: r0=347(x), r1=117(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 117
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
