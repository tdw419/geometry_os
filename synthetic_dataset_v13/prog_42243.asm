; DESCRIPTION: Places a black circle of radius 11 at center (39, 61).
; PLAN: r0=39(x), r1=61(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 61
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
