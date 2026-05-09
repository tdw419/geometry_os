; DESCRIPTION: Sets a single red pixel at (417, 125).
; PLAN: r0=417(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 125
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
