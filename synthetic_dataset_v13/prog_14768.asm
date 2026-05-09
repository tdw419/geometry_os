; DESCRIPTION: Creates a green circular shape at (134, 95) with radius 32.
; PLAN: r0=134(x), r1=95(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 95
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
