; DESCRIPTION: Places a yellow circle of radius 52 at center (140, 82).
; PLAN: r0=140(x), r1=82(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 82
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
