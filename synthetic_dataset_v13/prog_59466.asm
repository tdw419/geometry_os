; DESCRIPTION: Renders a black disk with center (179, 45) and radius 21.
; PLAN: r0=179(x), r1=45(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 45
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
