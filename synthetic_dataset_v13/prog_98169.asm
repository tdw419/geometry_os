; DESCRIPTION: Creates a black circular shape at (47, 211) with radius 25.
; PLAN: r0=47(x), r1=211(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 211
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
