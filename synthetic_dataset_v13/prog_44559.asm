; DESCRIPTION: Places a black circle of radius 11 at center (225, 218).
; PLAN: r0=225(x), r1=218(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 218
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
