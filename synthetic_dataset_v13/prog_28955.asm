; DESCRIPTION: Places a yellow circle of radius 80 at center (241, 148).
; PLAN: r0=241(x), r1=148(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 148
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
