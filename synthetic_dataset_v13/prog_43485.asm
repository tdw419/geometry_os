; DESCRIPTION: Creates a black circular shape at (248, 171) with radius 43.
; PLAN: r0=248(x), r1=171(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 171
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
