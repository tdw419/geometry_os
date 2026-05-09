; DESCRIPTION: Places a blue dot at position (36, 51).
; PLAN: r0=36(x), r1=51(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 51
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
