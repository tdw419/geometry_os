; DESCRIPTION: Creates a yellow circular shape at (451, 87) with radius 48.
; PLAN: r0=451(x), r1=87(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 87
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
