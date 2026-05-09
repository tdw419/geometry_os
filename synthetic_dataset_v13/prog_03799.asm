; DESCRIPTION: Creates a yellow circular shape at (110, 92) with radius 56.
; PLAN: r0=110(x), r1=92(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 92
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
