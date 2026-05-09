; DESCRIPTION: Creates a black circular shape at (387, 57) with radius 31.
; PLAN: r0=387(x), r1=57(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 57
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
