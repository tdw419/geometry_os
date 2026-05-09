; DESCRIPTION: Draws a yellow circle centered at (390, 107) with radius 51.
; PLAN: r0=390(x), r1=107(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 107
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
