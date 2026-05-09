; DESCRIPTION: Creates a yellow circular shape at (104, 140) with radius 18.
; PLAN: r0=104(x), r1=140(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 140
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
