; DESCRIPTION: Places a yellow circle of radius 51 at center (153, 93).
; PLAN: r0=153(x), r1=93(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 93
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
