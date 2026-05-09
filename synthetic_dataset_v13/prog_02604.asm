; DESCRIPTION: Places a white circle of radius 51 at center (55, 107).
; PLAN: r0=55(x), r1=107(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 107
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
