; DESCRIPTION: Creates a yellow circular shape at (163, 171) with radius 25.
; PLAN: r0=163(x), r1=171(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 171
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
