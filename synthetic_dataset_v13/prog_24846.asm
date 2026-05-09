; DESCRIPTION: Renders a yellow disk with center (379, 68) and radius 51.
; PLAN: r0=379(x), r1=68(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 68
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
