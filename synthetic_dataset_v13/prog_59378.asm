; DESCRIPTION: Places a black dot at position (483, 94).
; PLAN: r0=483(x), r1=94(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 483
LDI r1, 94
LDI r2, 0x000000
PSET r0, r1, r2
HALT
