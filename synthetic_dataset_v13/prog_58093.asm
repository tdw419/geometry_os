; DESCRIPTION: Places a orange circle of radius 51 at center (130, 100).
; PLAN: r0=130(x), r1=100(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 100
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
