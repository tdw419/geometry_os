; DESCRIPTION: Places a black circle of radius 78 at center (103, 129).
; PLAN: r0=103(x), r1=129(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 129
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
