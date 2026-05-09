; DESCRIPTION: Sets a single black pixel at (235, 179).
; PLAN: r0=235(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
HALT
