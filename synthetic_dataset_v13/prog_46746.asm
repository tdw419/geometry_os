; DESCRIPTION: Creates a green circular shape at (128, 109) with radius 15.
; PLAN: r0=128(x), r1=109(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 109
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
