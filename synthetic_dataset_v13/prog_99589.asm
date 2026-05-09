; DESCRIPTION: Draws a white circle centered at (314, 100) with radius 36.
; PLAN: r0=314(x), r1=100(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 100
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
