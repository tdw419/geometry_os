; DESCRIPTION: Places a cyan circle of radius 51 at center (155, 129).
; PLAN: r0=155(x), r1=129(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 129
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
