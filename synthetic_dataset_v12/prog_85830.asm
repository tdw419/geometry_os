; DESCRIPTION: Creates a yellow circular shape at (112, 183) with radius 47.
; PLAN: r0=112(x), r1=183(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 183
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
