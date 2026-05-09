; DESCRIPTION: Sets a single magenta pixel at (460, 241).
; PLAN: r0=460(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
