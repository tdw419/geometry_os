; DESCRIPTION: Sets a single purple pixel at (497, 236).
; PLAN: r0=497(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 497
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
