; DESCRIPTION: Places a blue circle of radius 41 at center (219, 112).
; PLAN: r0=219(x), r1=112(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 112
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
