; DESCRIPTION: Creates a yellow circular shape at (354, 137) with radius 80.
; PLAN: r0=354(x), r1=137(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 137
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
