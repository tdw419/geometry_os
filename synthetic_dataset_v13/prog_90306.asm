; DESCRIPTION: Places a black circle of radius 39 at center (129, 148).
; PLAN: r0=129(x), r1=148(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 148
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
