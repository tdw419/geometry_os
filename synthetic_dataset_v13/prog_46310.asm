; DESCRIPTION: Sets a single black pixel at (437, 195).
; PLAN: r0=437(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 437
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
HALT
