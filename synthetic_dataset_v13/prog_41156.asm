; DESCRIPTION: Sets a single red pixel at (149, 119).
; PLAN: r0=149(x), r1=119(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 119
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
