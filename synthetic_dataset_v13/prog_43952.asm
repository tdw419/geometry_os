; DESCRIPTION: Sets a single magenta pixel at (236, 55).
; PLAN: r0=236(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
