; DESCRIPTION: Creates a yellow circular shape at (234, 171) with radius 52.
; PLAN: r0=234(x), r1=171(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 171
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
