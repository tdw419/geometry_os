; DESCRIPTION: Sets a single magenta pixel at (445, 89).
; PLAN: r0=445(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
