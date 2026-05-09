; DESCRIPTION: Sets a single cyan pixel at (299, 18).
; PLAN: r0=299(x), r1=18(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 18
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
