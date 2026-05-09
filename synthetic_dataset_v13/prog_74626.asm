; DESCRIPTION: Draws a yellow circle centered at (200, 71) with radius 33.
; PLAN: r0=200(x), r1=71(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 71
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
