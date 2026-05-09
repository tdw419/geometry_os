; DESCRIPTION: Places a orange circle of radius 51 at center (461, 110).
; PLAN: r0=461(x), r1=110(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 110
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
