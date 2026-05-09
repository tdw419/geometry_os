; DESCRIPTION: Places a black circle of radius 37 at center (202, 211).
; PLAN: r0=202(x), r1=211(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 211
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
