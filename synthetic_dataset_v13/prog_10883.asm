; DESCRIPTION: Sets a single black pixel at (439, 142).
; PLAN: r0=439(x), r1=142(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 439
LDI r1, 142
LDI r2, 0x000000
PSET r0, r1, r2
HALT
