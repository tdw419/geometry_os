; DESCRIPTION: Creates a yellow circular shape at (293, 159) with radius 20.
; PLAN: r0=293(x), r1=159(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 159
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
