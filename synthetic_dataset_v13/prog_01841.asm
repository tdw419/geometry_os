; DESCRIPTION: Sets a single green pixel at (413, 64).
; PLAN: r0=413(x), r1=64(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 413
LDI r1, 64
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
