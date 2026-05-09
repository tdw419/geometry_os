; DESCRIPTION: Places a yellow circle of radius 14 at center (374, 170).
; PLAN: r0=374(x), r1=170(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 170
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
