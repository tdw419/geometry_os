; DESCRIPTION: Sets a single purple pixel at (440, 164).
; PLAN: r0=440(x), r1=164(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 164
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
