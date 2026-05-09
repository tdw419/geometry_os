; DESCRIPTION: Places a red dot at position (466, 235).
; PLAN: r0=466(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 235
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
