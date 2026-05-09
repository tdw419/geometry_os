; DESCRIPTION: Draws a white circle centered at (200, 124) with radius 47.
; PLAN: r0=200(x), r1=124(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 124
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
