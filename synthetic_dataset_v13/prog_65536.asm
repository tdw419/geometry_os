; DESCRIPTION: Places a black circle of radius 80 at center (210, 101).
; PLAN: r0=210(x), r1=101(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 101
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
