; DESCRIPTION: Places a yellow circle of radius 35 at center (38, 129).
; PLAN: r0=38(x), r1=129(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 129
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
