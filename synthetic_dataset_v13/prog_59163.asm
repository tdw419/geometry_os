; DESCRIPTION: Places a orange circle of radius 22 at center (486, 58).
; PLAN: r0=486(x), r1=58(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 58
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
