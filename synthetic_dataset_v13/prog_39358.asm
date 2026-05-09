; DESCRIPTION: Places a blue dot at position (3, 77).
; PLAN: r0=3(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
