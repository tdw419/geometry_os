; DESCRIPTION: Creates a green circular shape at (267, 179) with radius 36.
; PLAN: r0=267(x), r1=179(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 179
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
