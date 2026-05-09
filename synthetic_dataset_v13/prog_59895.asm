; DESCRIPTION: Sets a single green pixel at (422, 192).
; PLAN: r0=422(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
