; DESCRIPTION: Creates a yellow circular shape at (487, 134) with radius 10.
; PLAN: r0=487(x), r1=134(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 134
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
