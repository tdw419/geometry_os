; DESCRIPTION: Places a black circle of radius 20 at center (218, 39).
; PLAN: r0=218(x), r1=39(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 39
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
