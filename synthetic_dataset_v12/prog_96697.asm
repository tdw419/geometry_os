; DESCRIPTION: Sets a single black pixel at (75, 235).
; PLAN: r0=75(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
HALT
