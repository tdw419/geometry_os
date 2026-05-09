; DESCRIPTION: Creates a green circular shape at (159, 171) with radius 65.
; PLAN: r0=159(x), r1=171(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 171
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
