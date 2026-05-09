; DESCRIPTION: Sets a single red pixel at (82, 96).
; PLAN: r0=82(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
