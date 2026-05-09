; DESCRIPTION: Sets a single green pixel at (12, 235).
; PLAN: r0=12(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 235
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
