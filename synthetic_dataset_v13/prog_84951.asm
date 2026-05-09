; DESCRIPTION: Sets a single purple pixel at (116, 229).
; PLAN: r0=116(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
