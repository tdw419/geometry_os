; DESCRIPTION: Places a green circle of radius 51 at center (375, 109).
; PLAN: r0=375(x), r1=109(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 109
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
