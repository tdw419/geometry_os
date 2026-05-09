; DESCRIPTION: Places a yellow circle of radius 46 at center (419, 195).
; PLAN: r0=419(x), r1=195(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 195
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
