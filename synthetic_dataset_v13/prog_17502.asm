; DESCRIPTION: Sets a single magenta pixel at (298, 108).
; PLAN: r0=298(x), r1=108(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 108
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
