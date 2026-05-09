; DESCRIPTION: Creates a black circular shape at (418, 94) with radius 64.
; PLAN: r0=418(x), r1=94(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 94
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
