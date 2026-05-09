; DESCRIPTION: Sets a single purple pixel at (336, 178).
; PLAN: r0=336(x), r1=178(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 178
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
