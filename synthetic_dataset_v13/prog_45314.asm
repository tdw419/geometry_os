; DESCRIPTION: Creates a yellow circular shape at (83, 108) with radius 79.
; PLAN: r0=83(x), r1=108(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 108
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
