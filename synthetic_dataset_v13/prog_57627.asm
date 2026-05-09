; DESCRIPTION: Creates a yellow circular shape at (378, 114) with radius 33.
; PLAN: r0=378(x), r1=114(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 114
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
