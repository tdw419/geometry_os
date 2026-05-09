; DESCRIPTION: Sets a single cyan pixel at (422, 64).
; PLAN: r0=422(x), r1=64(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 64
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
