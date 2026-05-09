; DESCRIPTION: Places a yellow circle of radius 36 at center (56, 82).
; PLAN: r0=56(x), r1=82(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 82
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
