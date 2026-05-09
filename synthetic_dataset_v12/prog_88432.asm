; DESCRIPTION: Creates a yellow circular shape at (463, 105) with radius 48.
; PLAN: r0=463(x), r1=105(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 105
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
