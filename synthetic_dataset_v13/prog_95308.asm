; DESCRIPTION: Creates a black circular shape at (426, 177) with radius 57.
; PLAN: r0=426(x), r1=177(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 177
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
