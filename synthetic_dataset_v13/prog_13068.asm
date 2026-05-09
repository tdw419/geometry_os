; DESCRIPTION: Places a black dot at position (145, 216).
; PLAN: r0=145(x), r1=216(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 216
LDI r2, 0x000000
PSET r0, r1, r2
HALT
