; DESCRIPTION: Renders a yellow disk with center (301, 193) and radius 51.
; PLAN: r0=301(x), r1=193(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 193
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
