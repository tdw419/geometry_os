; DESCRIPTION: Creates a green circular shape at (267, 194) with radius 52.
; PLAN: r0=267(x), r1=194(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 194
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
