; DESCRIPTION: Sets a single yellow pixel at (487, 79).
; PLAN: r0=487(x), r1=79(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 79
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
