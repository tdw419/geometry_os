; DESCRIPTION: Sets a single purple pixel at (506, 204).
; PLAN: r0=506(x), r1=204(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 506
LDI r1, 204
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
