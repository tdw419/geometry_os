; DESCRIPTION: Places a blue circle of radius 38 at center (51, 162).
; PLAN: r0=51(x), r1=162(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 162
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
