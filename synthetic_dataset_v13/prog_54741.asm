; DESCRIPTION: Creates a yellow circular shape at (265, 155) with radius 61.
; PLAN: r0=265(x), r1=155(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 155
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
