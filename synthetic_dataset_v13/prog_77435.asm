; DESCRIPTION: Sets a single purple pixel at (332, 59).
; PLAN: r0=332(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
