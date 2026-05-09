; DESCRIPTION: Places a purple dot at position (37, 235).
; PLAN: r0=37(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
