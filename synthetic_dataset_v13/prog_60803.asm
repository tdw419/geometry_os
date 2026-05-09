; DESCRIPTION: Sets a single purple pixel at (76, 150).
; PLAN: r0=76(x), r1=150(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 150
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
