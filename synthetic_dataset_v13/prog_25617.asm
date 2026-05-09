; DESCRIPTION: Sets a single purple pixel at (27, 125).
; PLAN: r0=27(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
