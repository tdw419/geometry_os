; DESCRIPTION: Places a purple circle of radius 78 at center (140, 114).
; PLAN: r0=140(x), r1=114(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 114
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
