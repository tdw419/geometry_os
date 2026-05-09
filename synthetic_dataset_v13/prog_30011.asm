; DESCRIPTION: Sets a single purple pixel at (500, 242).
; PLAN: r0=500(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 500
LDI r1, 242
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
