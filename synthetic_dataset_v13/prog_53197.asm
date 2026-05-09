; DESCRIPTION: Places a blue dot at position (437, 129).
; PLAN: r0=437(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 437
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
