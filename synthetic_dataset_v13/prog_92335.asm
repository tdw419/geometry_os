; DESCRIPTION: Sets a single purple pixel at (400, 33).
; PLAN: r0=400(x), r1=33(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 33
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
