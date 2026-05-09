; DESCRIPTION: Creates a white circular shape at (267, 201) with radius 37.
; PLAN: r0=267(x), r1=201(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 201
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
