; DESCRIPTION: Places a yellow circle of radius 74 at center (204, 82).
; PLAN: r0=204(x), r1=82(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 82
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
