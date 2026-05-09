; DESCRIPTION: Places a black circle of radius 13 at center (417, 190).
; PLAN: r0=417(x), r1=190(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 190
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
