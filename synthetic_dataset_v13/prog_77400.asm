; DESCRIPTION: Renders a green disk with center (379, 109) and radius 45.
; PLAN: r0=379(x), r1=109(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 109
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
