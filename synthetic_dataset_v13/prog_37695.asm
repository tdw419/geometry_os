; DESCRIPTION: Draws a white circle centered at (111, 201) with radius 46.
; PLAN: r0=111(x), r1=201(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 201
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
