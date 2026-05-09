; DESCRIPTION: Draws a white circle centered at (314, 204) with radius 44.
; PLAN: r0=314(x), r1=204(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 204
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
