; DESCRIPTION: Sets a single purple pixel at (165, 236).
; PLAN: r0=165(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
