; DESCRIPTION: Places a yellow circle of radius 73 at center (302, 118).
; PLAN: r0=302(x), r1=118(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 118
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
