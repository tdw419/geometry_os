; DESCRIPTION: Places a black circle of radius 10 at center (20, 190).
; PLAN: r0=20(x), r1=190(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 190
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
