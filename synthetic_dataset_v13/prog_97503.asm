; DESCRIPTION: Sets a single magenta pixel at (171, 202).
; PLAN: r0=171(x), r1=202(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 202
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
