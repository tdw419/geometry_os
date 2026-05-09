; DESCRIPTION: Sets a single green pixel at (367, 234).
; PLAN: r0=367(x), r1=234(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 234
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
