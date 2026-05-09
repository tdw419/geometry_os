; DESCRIPTION: Places a black circle of radius 48 at center (338, 78).
; PLAN: r0=338(x), r1=78(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 78
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
