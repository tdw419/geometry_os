; DESCRIPTION: Sets a single cyan pixel at (193, 211).
; PLAN: r0=193(x), r1=211(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 211
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
