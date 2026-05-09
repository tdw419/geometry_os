; DESCRIPTION: Places a black dot at position (467, 12).
; PLAN: r0=467(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
HALT
