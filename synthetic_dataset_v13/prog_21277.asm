; DESCRIPTION: Places a yellow circle of radius 51 at center (277, 75).
; PLAN: r0=277(x), r1=75(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 75
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
