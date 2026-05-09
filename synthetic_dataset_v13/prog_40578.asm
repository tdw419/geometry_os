; DESCRIPTION: Sets a single purple pixel at (171, 167).
; PLAN: r0=171(x), r1=167(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 167
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
