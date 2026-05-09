; DESCRIPTION: Sets a single purple pixel at (491, 134).
; PLAN: r0=491(x), r1=134(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 134
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
