; DESCRIPTION: Creates a yellow circular shape at (245, 39) with radius 31.
; PLAN: r0=245(x), r1=39(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 39
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
