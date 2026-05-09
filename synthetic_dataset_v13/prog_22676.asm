; DESCRIPTION: Sets a single red pixel at (150, 238).
; PLAN: r0=150(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
