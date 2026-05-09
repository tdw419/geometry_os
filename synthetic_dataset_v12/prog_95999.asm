; DESCRIPTION: Sets a single purple pixel at (197, 241).
; PLAN: r0=197(x), r1=241(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 241
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
