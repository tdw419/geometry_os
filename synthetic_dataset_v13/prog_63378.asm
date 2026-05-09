; DESCRIPTION: Creates a green circular shape at (251, 181) with radius 32.
; PLAN: r0=251(x), r1=181(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 181
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
