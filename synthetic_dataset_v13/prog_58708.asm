; DESCRIPTION: Places a purple circle of radius 34 at center (374, 77).
; PLAN: r0=374(x), r1=77(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 77
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
