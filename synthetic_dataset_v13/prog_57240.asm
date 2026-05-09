; DESCRIPTION: Creates a white circular shape at (267, 97) with radius 73.
; PLAN: r0=267(x), r1=97(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 97
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
