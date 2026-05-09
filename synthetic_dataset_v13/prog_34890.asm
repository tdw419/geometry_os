; DESCRIPTION: Places a yellow circle of radius 13 at center (486, 51).
; PLAN: r0=486(x), r1=51(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 51
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
