; DESCRIPTION: Creates a green circular shape at (249, 124) with radius 57.
; PLAN: r0=249(x), r1=124(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 124
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
