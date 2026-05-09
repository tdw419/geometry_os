; DESCRIPTION: Places a purple circle of radius 77 at center (391, 131).
; PLAN: r0=391(x), r1=131(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 131
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
