; DESCRIPTION: Sets a single magenta pixel at (27, 112).
; PLAN: r0=27(x), r1=112(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 112
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
