; DESCRIPTION: Places a yellow circle of radius 25 at center (335, 45).
; PLAN: r0=335(x), r1=45(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 45
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
