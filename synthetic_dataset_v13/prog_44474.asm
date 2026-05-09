; DESCRIPTION: Creates a black circular shape at (378, 213) with radius 18.
; PLAN: r0=378(x), r1=213(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 213
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
