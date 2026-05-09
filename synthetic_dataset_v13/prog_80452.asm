; DESCRIPTION: Places a yellow circle of radius 51 at center (211, 191).
; PLAN: r0=211(x), r1=191(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 191
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
