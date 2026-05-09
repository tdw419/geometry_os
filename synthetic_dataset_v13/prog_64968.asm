; DESCRIPTION: Creates a black circular shape at (385, 124) with radius 52.
; PLAN: r0=385(x), r1=124(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 124
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
