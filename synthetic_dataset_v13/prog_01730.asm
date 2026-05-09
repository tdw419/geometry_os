; DESCRIPTION: Creates a black circular shape at (441, 65) with radius 56.
; PLAN: r0=441(x), r1=65(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 65
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
