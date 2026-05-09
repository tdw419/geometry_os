; DESCRIPTION: Sets a single purple pixel at (495, 168).
; PLAN: r0=495(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
