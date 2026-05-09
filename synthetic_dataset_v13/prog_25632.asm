; DESCRIPTION: Creates a green circular shape at (81, 75) with radius 64.
; PLAN: r0=81(x), r1=75(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 75
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
