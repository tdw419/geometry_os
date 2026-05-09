; DESCRIPTION: Sets a single red pixel at (49, 243).
; PLAN: r0=49(x), r1=243(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 243
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
