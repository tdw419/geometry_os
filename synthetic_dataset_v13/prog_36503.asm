; DESCRIPTION: Creates a white circular shape at (451, 33) with radius 20.
; PLAN: r0=451(x), r1=33(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 33
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
