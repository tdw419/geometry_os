; DESCRIPTION: Places a yellow circle of radius 60 at center (388, 121).
; PLAN: r0=388(x), r1=121(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 121
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
