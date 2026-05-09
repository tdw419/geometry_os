; DESCRIPTION: Sets a single cyan pixel at (409, 140).
; PLAN: r0=409(x), r1=140(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 409
LDI r1, 140
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
