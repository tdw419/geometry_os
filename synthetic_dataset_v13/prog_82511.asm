; DESCRIPTION: Places a yellow circle of radius 58 at center (393, 73).
; PLAN: r0=393(x), r1=73(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 73
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
