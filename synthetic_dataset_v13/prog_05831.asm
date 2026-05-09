; DESCRIPTION: Creates a yellow circular shape at (194, 44) with radius 37.
; PLAN: r0=194(x), r1=44(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 44
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
