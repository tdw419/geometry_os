; DESCRIPTION: Creates a green circular shape at (498, 183) with radius 13.
; PLAN: r0=498(x), r1=183(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 498
LDI r1, 183
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
