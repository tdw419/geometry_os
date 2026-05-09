; DESCRIPTION: Renders a yellow disk with center (293, 51) and radius 47.
; PLAN: r0=293(x), r1=51(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 51
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
