; DESCRIPTION: Creates a yellow circular shape at (329, 171) with radius 79.
; PLAN: r0=329(x), r1=171(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 171
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
