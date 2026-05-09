; DESCRIPTION: Places a black circle of radius 66 at center (218, 100).
; PLAN: r0=218(x), r1=100(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 100
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
