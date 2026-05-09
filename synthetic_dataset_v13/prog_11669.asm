; DESCRIPTION: Places a yellow circle of radius 18 at center (461, 76).
; PLAN: r0=461(x), r1=76(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 76
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
