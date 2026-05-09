; DESCRIPTION: Creates a yellow circular shape at (137, 57) with radius 27.
; PLAN: r0=137(x), r1=57(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 57
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
