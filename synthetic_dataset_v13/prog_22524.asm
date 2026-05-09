; DESCRIPTION: Creates a green circular shape at (341, 111) with radius 30.
; PLAN: r0=341(x), r1=111(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 111
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
