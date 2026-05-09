; DESCRIPTION: Renders a yellow disk with center (477, 31) and radius 10.
; PLAN: r0=477(x), r1=31(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 31
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
