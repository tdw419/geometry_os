; DESCRIPTION: Creates a black circular shape at (126, 112) with radius 32.
; PLAN: r0=126(x), r1=112(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 112
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
