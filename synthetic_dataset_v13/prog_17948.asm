; DESCRIPTION: Sets a single purple pixel at (404, 7).
; PLAN: r0=404(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 404
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
