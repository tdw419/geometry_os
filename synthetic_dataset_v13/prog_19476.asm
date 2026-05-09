; DESCRIPTION: Sets a single purple pixel at (434, 238).
; PLAN: r0=434(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 238
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
