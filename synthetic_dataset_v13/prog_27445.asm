; DESCRIPTION: Places a purple circle of radius 75 at center (197, 102).
; PLAN: r0=197(x), r1=102(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 102
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
