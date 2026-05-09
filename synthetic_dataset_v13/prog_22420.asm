; DESCRIPTION: Creates a green circular shape at (461, 171) with radius 50.
; PLAN: r0=461(x), r1=171(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 171
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
