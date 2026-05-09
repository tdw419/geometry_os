; DESCRIPTION: Creates a yellow circular shape at (64, 68) with radius 17.
; PLAN: r0=64(x), r1=68(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 68
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
