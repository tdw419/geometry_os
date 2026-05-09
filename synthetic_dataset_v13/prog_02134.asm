; DESCRIPTION: Sets a single magenta pixel at (391, 46).
; PLAN: r0=391(x), r1=46(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 46
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
