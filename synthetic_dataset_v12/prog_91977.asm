; DESCRIPTION: Sets a single purple pixel at (40, 48).
; PLAN: r0=40(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
