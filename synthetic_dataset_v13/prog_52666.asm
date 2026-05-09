; DESCRIPTION: Sets a single purple pixel at (399, 59).
; PLAN: r0=399(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
