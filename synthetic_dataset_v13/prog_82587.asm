; DESCRIPTION: Creates a black circular shape at (260, 211) with radius 32.
; PLAN: r0=260(x), r1=211(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 211
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
