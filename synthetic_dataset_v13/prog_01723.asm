; DESCRIPTION: Creates a yellow circular shape at (453, 189) with radius 45.
; PLAN: r0=453(x), r1=189(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 189
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
