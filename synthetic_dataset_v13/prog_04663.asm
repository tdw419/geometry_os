; DESCRIPTION: Creates a yellow circular shape at (378, 108) with radius 53.
; PLAN: r0=378(x), r1=108(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 108
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
