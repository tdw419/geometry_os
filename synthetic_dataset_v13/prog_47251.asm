; DESCRIPTION: Places a black circle of radius 45 at center (382, 211).
; PLAN: r0=382(x), r1=211(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 211
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
