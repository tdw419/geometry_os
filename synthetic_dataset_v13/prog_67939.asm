; DESCRIPTION: Sets a single purple pixel at (218, 1).
; PLAN: r0=218(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
