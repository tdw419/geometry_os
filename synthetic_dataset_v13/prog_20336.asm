; DESCRIPTION: Creates a green circular shape at (51, 64) with radius 13.
; PLAN: r0=51(x), r1=64(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 64
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
