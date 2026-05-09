; DESCRIPTION: Places a yellow circle of radius 55 at center (345, 161).
; PLAN: r0=345(x), r1=161(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 161
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
