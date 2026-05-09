; DESCRIPTION: Places a purple circle of radius 38 at center (276, 114).
; PLAN: r0=276(x), r1=114(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 114
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
