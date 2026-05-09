; DESCRIPTION: Places a blue dot at position (58, 77).
; PLAN: r0=58(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
