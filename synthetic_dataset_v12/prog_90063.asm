; DESCRIPTION: Sets a single purple pixel at (113, 225).
; PLAN: r0=113(x), r1=225(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 225
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
