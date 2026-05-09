; DESCRIPTION: Sets a single yellow pixel at (177, 112).
; PLAN: r0=177(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
