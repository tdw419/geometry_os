; DESCRIPTION: Sets a single green pixel at (367, 124).
; PLAN: r0=367(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
