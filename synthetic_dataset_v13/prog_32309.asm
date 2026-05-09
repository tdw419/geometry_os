; DESCRIPTION: Sets a single purple pixel at (428, 209).
; PLAN: r0=428(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
