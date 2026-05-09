; DESCRIPTION: Sets a single cyan pixel at (467, 149).
; PLAN: r0=467(x), r1=149(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 149
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
