; DESCRIPTION: Creates a yellow circular shape at (365, 110) with radius 49.
; PLAN: r0=365(x), r1=110(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 110
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
