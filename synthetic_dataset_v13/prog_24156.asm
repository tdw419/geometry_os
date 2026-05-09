; DESCRIPTION: Places a orange circle of radius 51 at center (366, 88).
; PLAN: r0=366(x), r1=88(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 88
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
