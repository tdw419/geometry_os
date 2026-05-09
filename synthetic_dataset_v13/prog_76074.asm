; DESCRIPTION: Renders a yellow disk with center (395, 87) and radius 51.
; PLAN: r0=395(x), r1=87(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 87
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
