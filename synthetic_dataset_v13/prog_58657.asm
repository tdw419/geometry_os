; DESCRIPTION: Sets a single purple pixel at (365, 156).
; PLAN: r0=365(x), r1=156(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 156
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
