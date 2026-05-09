; DESCRIPTION: Places a black circle of radius 75 at center (190, 75).
; PLAN: r0=190(x), r1=75(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 75
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
