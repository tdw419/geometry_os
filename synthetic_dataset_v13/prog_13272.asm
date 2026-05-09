; DESCRIPTION: Renders a yellow disk with center (293, 95) and radius 30.
; PLAN: r0=293(x), r1=95(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 95
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
