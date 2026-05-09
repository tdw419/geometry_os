; DESCRIPTION: Creates a yellow circular shape at (300, 105) with radius 44.
; PLAN: r0=300(x), r1=105(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 105
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
