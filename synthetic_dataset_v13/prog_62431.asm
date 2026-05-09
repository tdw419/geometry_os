; DESCRIPTION: Places a cyan circle of radius 51 at center (353, 142).
; PLAN: r0=353(x), r1=142(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 142
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
