; DESCRIPTION: Sets a single purple pixel at (340, 195).
; PLAN: r0=340(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 195
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
