; DESCRIPTION: Sets a single purple pixel at (237, 221).
; PLAN: r0=237(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 221
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
