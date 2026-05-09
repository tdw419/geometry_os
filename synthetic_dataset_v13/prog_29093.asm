; DESCRIPTION: Places a yellow circle of radius 31 at center (245, 121).
; PLAN: r0=245(x), r1=121(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 121
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
