; DESCRIPTION: Creates a black circular shape at (354, 107) with radius 36.
; PLAN: r0=354(x), r1=107(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 107
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
