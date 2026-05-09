; DESCRIPTION: Places a yellow circle of radius 34 at center (345, 82).
; PLAN: r0=345(x), r1=82(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 82
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
