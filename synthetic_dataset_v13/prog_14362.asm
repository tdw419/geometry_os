; DESCRIPTION: Places a blue circle of radius 51 at center (276, 106).
; PLAN: r0=276(x), r1=106(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 106
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
