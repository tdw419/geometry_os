; DESCRIPTION: Places a yellow circle of radius 26 at center (131, 227).
; PLAN: r0=131(x), r1=227(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 227
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
