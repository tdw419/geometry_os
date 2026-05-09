; DESCRIPTION: Creates a black circular shape at (274, 134) with radius 79.
; PLAN: r0=274(x), r1=134(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 134
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
