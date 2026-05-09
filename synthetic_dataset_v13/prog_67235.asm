; DESCRIPTION: Sets a single red pixel at (263, 77).
; PLAN: r0=263(x), r1=77(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 77
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
