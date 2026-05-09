; DESCRIPTION: Sets a single cyan pixel at (349, 145).
; PLAN: r0=349(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
