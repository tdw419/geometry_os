; DESCRIPTION: Places a blue dot at position (51, 66).
; PLAN: r0=51(x), r1=66(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 66
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
