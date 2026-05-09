; DESCRIPTION: Places a purple dot at position (178, 235).
; PLAN: r0=178(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
