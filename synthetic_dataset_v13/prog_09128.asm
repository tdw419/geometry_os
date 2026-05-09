; DESCRIPTION: Draws a red circle centered at (254, 200) with radius 31.
; PLAN: r0=254(x), r1=200(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 200
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
