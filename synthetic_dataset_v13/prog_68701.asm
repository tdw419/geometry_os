; DESCRIPTION: Sets a single black pixel at (323, 242).
; PLAN: r0=323(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
HALT
