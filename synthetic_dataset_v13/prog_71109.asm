; DESCRIPTION: Sets a single black pixel at (235, 101).
; PLAN: r0=235(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 101
LDI r2, 0x000000
PSET r0, r1, r2
HALT
