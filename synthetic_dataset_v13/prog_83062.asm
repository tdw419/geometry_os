; DESCRIPTION: Places a orange circle of radius 72 at center (374, 118).
; PLAN: r0=374(x), r1=118(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 118
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
