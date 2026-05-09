; DESCRIPTION: Sets a single red pixel at (89, 236).
; PLAN: r0=89(x), r1=236(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 236
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
