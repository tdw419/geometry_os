; DESCRIPTION: Places a black circle of radius 76 at center (417, 161).
; PLAN: r0=417(x), r1=161(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 161
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
