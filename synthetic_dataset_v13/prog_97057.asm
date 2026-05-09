; DESCRIPTION: Creates a green circular shape at (340, 80) with radius 73.
; PLAN: r0=340(x), r1=80(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 80
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
