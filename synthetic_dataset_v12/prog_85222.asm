; DESCRIPTION: Sets a single cyan pixel at (354, 218).
; PLAN: r0=354(x), r1=218(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 218
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
