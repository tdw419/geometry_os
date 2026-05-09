; DESCRIPTION: Places a orange circle of radius 14 at center (374, 162).
; PLAN: r0=374(x), r1=162(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 162
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
