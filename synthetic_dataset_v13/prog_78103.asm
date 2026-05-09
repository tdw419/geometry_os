; DESCRIPTION: Sets a single red pixel at (225, 217).
; PLAN: r0=225(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
