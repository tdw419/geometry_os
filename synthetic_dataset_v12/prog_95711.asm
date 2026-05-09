; DESCRIPTION: Creates a green circular shape at (348, 129) with radius 18.
; PLAN: r0=348(x), r1=129(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 129
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
