; DESCRIPTION: Places a black circle of radius 36 at center (71, 104).
; PLAN: r0=71(x), r1=104(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 104
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
