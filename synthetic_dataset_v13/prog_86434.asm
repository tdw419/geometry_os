; DESCRIPTION: Creates a green circular shape at (223, 166) with radius 30.
; PLAN: r0=223(x), r1=166(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 166
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
