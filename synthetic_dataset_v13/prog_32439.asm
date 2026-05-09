; DESCRIPTION: Sets a single blue pixel at (177, 120).
; PLAN: r0=177(x), r1=120(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 120
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
