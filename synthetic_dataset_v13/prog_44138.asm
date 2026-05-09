; DESCRIPTION: Places a yellow circle of radius 18 at center (324, 169).
; PLAN: r0=324(x), r1=169(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 169
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
