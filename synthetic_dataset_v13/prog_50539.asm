; DESCRIPTION: Sets a single purple pixel at (333, 199).
; PLAN: r0=333(x), r1=199(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 333
LDI r1, 199
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
