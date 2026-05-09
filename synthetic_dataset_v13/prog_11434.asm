; DESCRIPTION: Sets a single red pixel at (422, 23).
; PLAN: r0=422(x), r1=23(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 23
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
