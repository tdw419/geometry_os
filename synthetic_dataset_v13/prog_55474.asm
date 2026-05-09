; DESCRIPTION: Renders a black disk with center (276, 33) and radius 10.
; PLAN: r0=276(x), r1=33(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 33
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
