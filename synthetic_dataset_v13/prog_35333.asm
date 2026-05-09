; DESCRIPTION: Sets a single black pixel at (417, 226).
; PLAN: r0=417(x), r1=226(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 226
LDI r2, 0x000000
PSET r0, r1, r2
HALT
